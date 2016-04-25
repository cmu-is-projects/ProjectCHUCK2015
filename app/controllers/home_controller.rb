class HomeController < ApplicationController

  def index
    if  !current_user.nil?
      @notifications = Student.students_with_notifications
      @notifications_length = @notifications.length
      @tournament = Tournament.first
      # @guardians_receiving_texts = Guardian.active.alphabetical.receive_text_notifications.paginate(:page => params[:page]).per_page(10)
  #     @registrations = Registration.active
      @students = Student.active.alphabetical
      @current_registered_students = Student.alphabetical.active
      @school_districts = Student.by_district.size
      cs = Volunteer.alphabetical.by_role("Coach").to_a
      assis_cs = Volunteer.alphabetical.by_role("Assistant Coach").to_a
      @volunteers = cs + assis_cs
      #@students_missing_docs = Student.alphabetical.missing_forms(@current_registered_students).paginate(:page => params[:missing_docs_page], :per_page => 10)
      # @students_missing_docs = Student.alphabetical.current.without_forms.active.paginate(:page => params[:missing_docs_page], :per_page => 10)     
      @male_students = @current_registered_students.male.size
      @female_students = @current_registered_students.female.size
      @school_districts = Student.school_districts
      @jersey_sizes = Student.jersey_sizes
      @counties = Student.counties
      @genders = Student.genders
      @ages = Student.ages
     # @school_districts = Student.school_districts
      # @students = Student.all
      # @brackets = Student.by_bracket
      # @unassigned_students = Student.active.alphabetical.unassigned.paginate(:page => params[:unassigned_student_page], :per_page => 10)
      # @brackets = Bracket.all
      # @home_counties = Student.home_counties
      # for reg in Registration.current.active.by_date.select { |reg| reg.team_id == nil }
      #   @eligible_students = lambda {|bracket| where(Student.find(reg.student_id).age_as_of_june_1 >= min and Student.find(reg.student_id).age_as_of_june_1 <= max) }

      # Documentation can be found at https://github.com/michelson/lazy_high_charts
      
      @gender_chart = LazyHighCharts::HighChart.new('pie') do |f|
            f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 100, 60, 100]} )
            series = {
                     :type=> 'pie',
                     :name=> 'Gender',
                     :data=> @genders
            }
            f.series(series)
            # f.options[:title][:text] = "By Gender"
            f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
            f.plot_options(:pie=>{
              :allowPointSelect=>true, 
              :cursor=>"pointer" , 
              :dataLabels=>{
                :enabled=>true,
                :color=>"black",
                :style=>{
                  :font=>"13px Open Sans"
                }
              }
            })
      end

      @school_district_chart = LazyHighCharts::HighChart.new('pie') do |f|
            f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 100, 60, 100]} )
            series = {
                     :type=> 'pie',
                     :name=> 'School District',
                     :data=> @school_districts
            }
            f.series(series)
            # f.options[:title][:text] = "Registered Student School District Distribution"
            f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
            f.plot_options(:pie=>{
              :allowPointSelect=>true, 
              :cursor=>"pointer" , 
              :dataLabels=>{
                :enabled=>true,
                :color=>"black",
                :style=>{
                  :font=>"13px Open Sans"
                }
              }
            })
      end

      @jersey_sizes_chart = LazyHighCharts::HighChart.new('pie') do |f|
            f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 100, 60, 100]} )
            series = {
                     :type=> 'pie',
                     :name=> 'Jersey Sizes',
                     :data=> @jersey_sizes
            }
            f.series(series)
            # f.options[:title][:text] = "Registered Student School District Distribution"
            f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
            f.plot_options(:pie=>{
              :allowPointSelect=>true, 
              :cursor=>"pointer" , 
              :dataLabels=>{
                :enabled=>true,
                :color=>"black",
                :style=>{
                  :font=>"13px Open Sans"
                }
              }
            })
      end

      @counties_chart = LazyHighCharts::HighChart.new('pie') do |f|
            f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 100, 60, 100]} )
            series = {
                     :type=> 'pie',
                     :name=> 'Household Counties',
                     :data=> @counties
            }
            f.series(series)
            # f.options[:title][:text] = "Registered Student School District Distribution"
            f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
            f.plot_options(:pie=>{
              :allowPointSelect=>true, 
              :cursor=>"pointer" , 
              :dataLabels=>{
                :enabled=>true,
                :color=>"black",
                :style=>{
                  :font=>"13px Open Sans"
                }
              }
            })
      end

      @ages_chart = LazyHighCharts::HighChart.new('pie') do |f|
            f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 100, 60, 100]} )
            series = {
                     :type=> 'pie',
                     :name=> 'Ages',
                     :data=> @ages
            }
            f.series(series)
            # f.options[:title][:text] = "Registered Student School District Distribution"
            f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
            f.plot_options(:pie=>{
              :allowPointSelect=>true, 
              :cursor=>"pointer" , 
              :dataLabels=>{
                :enabled=>true,
                :color=>"black",
                :style=>{
                  :font=>"13px Open Sans"
                }
              }
            })
      end


      # @home_counties_chart = LazyHighCharts::HighChart.new('pie') do |f|
      #       f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
      #       series = {
      #                :type=> 'pie',
      #                :name=> 'Home Counties',
      #                :data=> @home_counties
      #       }
      #       f.series(series)
      #       f.options[:title][:text] = "Registered Student Home County Distribution"
      #       f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      #       f.plot_options(:pie=>{
      #         :allowPointSelect=>true, 
      #         :cursor=>"pointer" , 
      #         :dataLabels=>{
      #           :enabled=>true,
      #           :color=>"black",
      #           :style=>{
      #             :font=>"13px Trebuchet MS, Verdana, sans-serif"
      #           }
      #         }
      #       })
      # end 
      @current = Game.current.paginate(:page => params[:page]).per_page(5)
    end   
  end

  def notifications
    @filterrific = initialize_filterrific(
      Student.not_fully_checked_off,
      params[:filterrific],
      select_options: {
        sorted_by: Student.options_for_sorted_by,
      }
        #persistence_id: 'shared_key',
        #default_filter_params: {},
        #available_filters: [],
        ) or return

    @students = @filterrific.find.page(params[:page]).per_page(20)

    if logged_in? && not(current_user.role?(:admin))
      flash[:error] = "You must be logged in as an administrator to view this page."
      redirect_to home_path
    elsif !logged_in?
      flash[:error] = "You must login to access this page."
      redirect_to home_path
    end
  end

  def schedule
    @past = Game.past.chronologicald.paginate(:page => params[:page]).per_page(10)
    @current = Game.current.chronologicald.paginate(:page => params[:page]).per_page(10)
    @upcoming = Game.upcoming.chronologicald.paginate(:page => params[:page]).per_page(10)
  end

  def standings
  end

  def analytics
    @students = Student.all
    @gender_stats = Student.gender_stats
    @age_stats = Student.age_stats
    @county_stats = Student.county_stats
    @school_district_stats = Student.school_district_stats
  end

  def download_data
    #load_and_authorize_resource figure out a way to stop everyone from viewing this
	@users = User.all
	respond_to do |format|
		format.html
		format.csv { send_data  @users.to_csv }
		format.xls #{ send_data  @users.to_csv(col_sep: "\t") }
	end
end

end

