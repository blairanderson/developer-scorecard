class UsersController < ApplicationController

  after_filter :fetch_github_stats

  def show
    @connections = Connection.includes(:stats).where(identity: params[:id] ).all
    render json: @connections, root: 'connections', meta: meta, meta_key: 'meta_object'
  end

  def provider
    provider_cd = Connection.send(params[:provider])
    @connection = Connection.includes(:stats).where(identity: params[:id], provider_cd: provider_cd).first
    render json: @connection, root: 'connection', meta: meta, meta_key: 'meta_object'
  end


  def fetch_github_stats
    ConnectionStatSync.new("github", params[:id]).fetch
  end
end