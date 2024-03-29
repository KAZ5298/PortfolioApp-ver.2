class TweetsController < ApplicationController
  before_filter :require_login, except: [:index]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end
  
  def timeline
    @tweets = Tweet.eager_load(user: :inverse_follows).where(follows: { follower_id: current_user.id })
    @tweet  = Tweet.new
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url, notice: "ツイートを送信しました" }
        format.json { render :show, status: :created, location: @tweet }
      else
        @tweets = Tweet.all
        format.html { render :index }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "ツイートを更新しました" }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "ツイートを削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
class TweetsController < ApplicationController
  before_filter :require_login, except: [:index]
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end
  
  def timeline
    @tweets = Tweet.eager_load(user: :inverse_follows).where(follows: { follower_id: current_user.id })
    @tweet  = Tweet.new
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url, notice: "ツイートを送信しました" }
        format.json { render :show, status: :created, location: @tweet }
      else
        @tweets = Tweet.all
        format.html { render :index }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "ツイートを更新しました" }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "ツイートを削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
