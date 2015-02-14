class Internal
  PI_DATA_PATH = Rails.root.to_s + '/internal/data/sarah_pi.txt'

  def self.sarah_pi(params)
    File.open(PI_DATA_PATH, "w+") do |f|
      f.write(params)
    end
  end

  def self.check_sarah_pi
    if File.exist? PI_DATA_PATH
      # Update something with sensor data
      File.delete PI_DATA_PATH
      return true
    else
      MyMailer.sarah_pi_down.deliver
      return false
    end
  end
end