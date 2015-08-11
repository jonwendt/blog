class InternalController < ApplicationController
  def sarah_pi
    Internal.sarah_pi(params)

    render text: 'File written.'
  end

  def check_sarah_pi
    if Internal.check_sarah_pi
      render text: "Sarah's Pi checked in!"
    else
      render text: "Sarah's Pi has NOT checked in! Email sent."
    end
  end
end
