class RpgController < ApplicationController
  def index
    session[:total_gold] = session[:random_num].to_i + session[:total_gold].to_i
    @total_gold = session[:total_gold].to_i
    session[:activity] = [] if !session[:activity]
    session[:activity].push(session[:message])
    session[:random_num] = 0
  end

  def cave
    @ti = Time.now
    session[:random_num] = rand(5..10)
    session[:message] = "You have entered the Cave and earned #{session[:random_num]} points! (#{@ti})"
    redirect_to :action=> :index
  end

  def farm
    @ti = Time.now
    session[:random_num] = rand(10..20)
    session[:message] = "You have entered the Farm and earned #{session[:random_num]} points! (#{@ti})"
    redirect_to :action=> :index
  end

  def casino
    @ti = Time.now
    session[:random_num] = rand(-50..50)
      if session[:random_num] < 0
        session[:message] = "You have entered the Casino and lost #{session[:random_num]} points! (#{@ti})"
      else
        session[:message] = "You have entered the Casino and earned #{session[:random_num]} points! (#{@ti})"
      end
      redirect_to :action=> :index
  end

  def house
    @ti = Time.now
    session[:random_num] = rand(2..5)
    session[:message] = "You have entered the House and earned #{session[:random_num]} points! (#{@ti})"
    redirect_to :action=> :index
  end

  def reset
    reset_session
    redirect_to :action=> :index
  end
  def activities

  end
end
