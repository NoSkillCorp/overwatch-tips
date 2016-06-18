App.counter = App.cable.subscriptions.create('CounterChannel', {  
  received: function(data) {
    console.log(data)
    $('#tips_count').html(data.tips);
    $('#votes_count').html(data.votes);
    return 
  }
});