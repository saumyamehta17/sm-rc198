class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :comment]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def edit_multiple
    @posts = Post.find(params[:post_ids])
  end

  def update_multiple
    @posts  = Post.find(params[:post_ids])
    @posts.each do |post|
      post.update_attributes(post_params.reject {|v| v.blank?})
    end
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Updated' }
    end
  end

  def edit_individual
    @posts = Post.find(params[:post_ids])
  end

  def update_individual
    #update all posts with single line
    @posts = Post.update(params[:posts].keys, params[:posts].values).reject {|p| p.errors.empty?}
    if @posts.empty?
      flash[:notice] = "Posts updated"
      redirect_to posts_path
    else
      render 'edit_individual'
    end
  end
  #sample action to learn routes
  def about

  end

  #Railscast 204
  def comment
    @comments = @post.comments.all
    unless params[:"/comment/#{params[:id]}"].blank?
      @name = params[:"/comment/#{params[:id]}"][:name]
      @content = params[:"/comment/#{params[:id]}"][:content]
      @post.comments.create(name: @name, content: @content)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name)
    end
end
