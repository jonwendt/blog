class InternalController < ApplicationController
  def sarah_pi
    path = Rails.root.to_s + '/internal/data/sarah_pi.txt'
    File.open(path, "w+") do |f|
      f.write(params)
    end

    render text: 'File written.'
  end
end