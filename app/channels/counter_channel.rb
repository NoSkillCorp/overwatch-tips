class CounterChannel < ApplicationCable::Channel  
  def subscribed
    stream_from 'counter'
  end
end  