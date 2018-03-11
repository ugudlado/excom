class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  def next_active
    @meeting = Meeting.where(:status => true).order(id: :desc).first
  end

  def validate_voter_id
    @member = Member.find_by! email: params['voter_id']+'@advisory.com'

    render :json => {profile: @member}
  end

  def vote
    @meeting = Meeting.find(params['id'])
    @member = Member.find_by email: params['voter_id']
    
    if params['Prepared speaker']
      @p_role_player = RolePlayer.find(params['Prepared speaker'])
      @preparedvoteResult = VoteResult.find_by meeting: @meeting, member: @member, role:@p_role_player.role
      @preparedvoteResult = VoteResult.new if !@preparedvoteResult
      @preparedvoteResult.meeting = @meeting
      @preparedvoteResult.member = @member
      @preparedvoteResult.role = @p_role_player.role
      @preparedvoteResult.speaker = @p_role_player.member
      @preparedvoteResult.vote = 1
      @preparedvoteResult.save
    end

    if params['Table topic speaker']
      @tt_role_player = RolePlayer.find(params['Table topic speaker'])
      @ttvoteResult = VoteResult.find_by meeting: @meeting, member: @member, role:@tt_role_player.role
      @ttvoteResult = VoteResult.new if !@ttvoteResult
      @ttvoteResult.meeting = @meeting
      @ttvoteResult.member = @member
      @ttvoteResult.role = @tt_role_player.role
      @ttvoteResult.speaker = @tt_role_player.member
      @ttvoteResult.vote = 1
      @ttvoteResult.save
    end

    if params['Evaluator']
      @e_role_player = RolePlayer.find(params['Evaluator'])
      @evoteResult = VoteResult.find_by meeting: @meeting, member: @member, role:@tt_role_player.role
      @evoteResult = VoteResult.new if !@evoteResult
      @evoteResult.meeting = @meeting
      @evoteResult.member = @member
      @evoteResult.role = @e_role_player.role
      @evoteResult.speaker = @e_role_player.member
      @evoteResult.vote = 1
      @evoteResult.save
    end

    if !params['feedback'].blank?
      @feedback = FeedbackNote.find_by member: @member, meeting:@meeting
      @feedback = FeedbackNote.new if !@feedback
      @feedback.member = @member
      @feedback.meeting = @meeting
      @feedback.note = params['feedback']
      @feedback.save
    end

    @int_params = params.keys.select{|i| i.to_i if i.match(/^\d+$/)}
    if @int_params.any?
      @int_params.each do |rp| 
        if !params[rp].blank?
          @role_player = RolePlayer.find(rp)
          @voteResult = VoteResult.find_by meeting: @meeting, member: @member, speaker:@role_player.member
          @voteResult = VoteResult.new if !@voteResult
          @voteResult.meeting = @meeting
          @voteResult.member = @member
          @voteResult.role = @role_player.role
          @voteResult.speaker = @role_player.member
          @voteResult.note = params[rp]
          @voteResult.save
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Thanks for feedback.' }
      format.json { render '/', status: :ok, location: @meeting }
    end
  end


  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # GET /meetings/1/edit
  def activate
    Meeting.update_all status: false
    @meeting = Meeting.find(params['id'])
    @meeting.status = true
    @meeting.save
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting activated.' }
      format.json { head :no_content }
    end
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to do |format|
      @role_player = RolePlayer.new
      @role_player.member = Member.find(params['meeting']['member_id'])
      @role_player.role = Role.find(params['meeting']['role_id'])
      @role_player.meeting = @meeting
      @role_player.save

      if @meeting.save
        format.html { redirect_to edit_meeting_path(@meeting), notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      @member = Member.find(params['meeting']['member_id'])
      @role_player = @meeting.role_players.find_by member: @member
      if !@role_player
        @role_player = RolePlayer.new
        @role_player.meeting = @meeting         
        @role_player.member =  @member
      end
      @role_player.role = Role.find_by id: params['meeting']['role_id']
      @role_player.save
      print @role_player.member.id
      print @role_player.role.id

      if @meeting.update(meeting_params)
        format.html { redirect_to edit_meeting_path(@meeting), notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    # @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:start_date)
    end
end
