class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  before_action :require_login, only: [:destroy]

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag: '#{@tag.name}' Deleted!"

    redirect_to tags_path(@tags)
  end
end
