class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
    @takenoko_point = @kinoko_point = 0
    @takenoko_signal_point = @takenoko_yj_point = 0
    @kinoko_signal_point = @kinoko_yj_point = 0

    @votes.each {|vote|
      if vote.party == 'takenoko'
        @takenoko_point += 1
        if vote.company == 'signal'
          @takenoko_signal_point += 1
        else
          @takenoko_yj_point += 1
        end 
      elsif vote.party == 'kinoko'
        @kinoko_point += 1 
        if vote.company == 'signal'
          @kinoko_signal_point += 1
        else
          @kinoko_yj_point += 1
        end 
      end
    }
    @chats = Chat.all
    @chat = Chat.new
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to :action => "index", notice: 'Vote was successfully created.' }
        format.json { render :index, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:party, :company)

    end
end
