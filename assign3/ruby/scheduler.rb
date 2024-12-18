class MeetingDetails
  attr_reader :name, :starts, :ends, :on, :participating

  def name(name)
    @name = name
  end

  def set_time(time)
    [time.div(100), time % 100]
  end

  def starts(time)
    @starts = set_time(time)
  end

  def ends(time)
    @ends = set_time(time)
  end

  def duration
    return unless @starts && @ends
    
    hours, minutes = ((@ends.first * 60 + @ends.last) - (@starts.first * 60 + @starts.last)).divmod(60)
  
    "Duration: #{hours} hour#{'s' if hours != 1} and #{minutes} minute#{'s' if minutes != 1}"
  end

  def on(on)
    @on = on
  end

    Integer.class_eval do
      def /(n)
        "#{self}/#{n}"
      end
    end
    
    String.class_eval do
      def /(n)
        "#{self}/#{n}"
      end
    end

  def participating(*participants)
    @participating = participants
  end

  def to_s
    meeting = "Meeting: #{@name}"
    meeting += ", Start Time: #{@starts.first}:#{@starts.last}" if @starts
    meeting += ", End Time: #{@ends.first}:#{@ends.last}" if @ends
    meeting += ", #{duration}" if @starts && @ends
    meeting += ", Date: #{@on}" if @on
    meeting += ", #{@participating.size} Participants, Participants: #{@participating.join(', ')}" if @participating
    meeting
  end

end

def schedule(meeting)
  meeting
end

def meeting(&block)
  context = MeetingDetails.new
  
  context.instance_eval(&block) if block_given?
  
  context.to_s
end
