#command: "echo 'Hello World!'"

# the refresh frequency in milliseconds
refreshFrequency: 500

# render gets called after the shell command has executed. The command's output
# is passed in as a string. Whatever it returns will get rendered as HTML.
render: (output) -> """
  <div id="binary-clock-hour" class="binary-clock-group">
    <div class="sphera-group">
      <span class="sphera-default" name="16">16</span>
      <span class="sphera-default" name="8">8</span>
      <span class="sphera-default" name="4">4</span>
      <span class="sphera-default" name="2">2</span>
      <span class="sphera-default" name="1">1</span>
    </div>
    <label class="clock-label">Hours</label>
  </div>
  <div id="binary-clock-minute" class="binary-clock-group">
    <div class="sphera-group">
      <span class="sphera-default" name="32">32</span>
      <span class="sphera-default" name="16">16</span>
      <span class="sphera-default" name="8">8</span>
      <span class="sphera-default" name="4">4</span>
      <span class="sphera-default" name="2">2</span>
      <span class="sphera-default" name="1">1</span>
    </div>
    <label class="clock-label">Minutes</label>
  </div>
  <div id="binary-clock-second" class="binary-clock-group">
    <div class="sphera-group">
      <span class="sphera-default" name="32">32</span>
      <span class="sphera-default" name="16">16</span>
      <span class="sphera-default" name="8">8</span>
      <span class="sphera-default" name="4">4</span>
      <span class="sphera-default" name="2">2</span>
      <span class="sphera-default" name="1">1</span>
    </div>
    <label class="clock-label">Seconds</label>
  </div>
"""

# Update the rendered output.
update: (output, domEl) -> 

  # Receives an integer number and converts it to an array of the numbers used to represent binary numbers
  # Ex: numberToBinary(37) -> [ 32, 4, 1 ]
  numberToBinary = (num) ->
    bins = []
    while num > 1
      div = num/2
      twoDiv = Math.ceil(Math.log2(div))
      expTwo = Math.pow(2,twoDiv)
      if div is expTwo
        toPush = num
      else
        toPush = expTwo

      bins.push toPush
      num = num - toPush
    
    if num is 1
      bins.push 1

    return bins

  # Modify the classes of the 'span' tags inside each group (hour, minute, second) in order to fill the ones that must be filled
  modifySphere = (sphereGroupId, nums) ->
    $('#' + sphereGroupId).find('span').removeClass('sphera-fill');
    $('#' + sphereGroupId).find('span').addClass('sphera-default');
    for num in nums
      el = $('#' + sphereGroupId).find('[name="' + num + '"]');
      el.removeClass('sphera-default');
      el.addClass('sphera-fill');

  currDate = new Date();
  hour = currDate.getHours();
  minute = currDate.getMinutes();
  #second = if currDate.getSeconds() is 59 then 0 else currDate.getSeconds() + 1;
  second = currDate.getSeconds();

  binaryHourNums = numberToBinary(hour);
  modifySphere( 'binary-clock-hour', binaryHourNums );

  binaryMinuteNums = numberToBinary(minute);
  modifySphere( 'binary-clock-minute', binaryMinuteNums );

  binarySecondNums = numberToBinary(second);
  modifySphere( 'binary-clock-second', binarySecondNums );

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """

  /*
    Start - Global configuration
  */
  
  display-numbers-fill = 1
  display-numbers-unfill = 0
  sphera-fill-bg-color = #007AFF
  sphera-fill-font-color = #FFFFFF
  sphera-unfill-font-color = #000000
  top = 3%
  right = -5%

  /*
    End - Global configuration
  */

  if display-labels
    display-labels = inherit
    labels-width = 25
  else
    display-labels = none
    labels-width = 0
  
  sphera-group-width = 100 - labels-width
  sphera-fill-font-color = alpha(sphera-fill-font-color, display-numbers-fill)
  sphera-unfill-font-color = alpha(sphera-unfill-font-color, display-numbers-unfill)

  top: top
  right: right
  width: 340px
  text-align: justify

  h1
    font-size: 20px
    font-weight: 300
    margin: 16px 0 8px

  .sphera-default
    display: inline-block
    width: 20px
    height: 20px
    background-color: inherit
    border: 0.5px solid black
    border-radius: 15px
    text-align: center
    font-family: Helvetica Neue
    font-size: 0.7em
    line-height: 20px
    color: sphera-unfill-font-color

  .sphera-fill
    display: inline-block
    width: 20px
    height: 20px
    background-color: sphera-fill-bg-color
    border: 0.5px solid black
    border-radius: 15px
    text-align: center
    font-family: Helvetica Neue
    font-size: 0.7em
    line-height: 20px
    color: sphera-fill-font-color

  .clock-label
    font-family: Helvetica Neue
    float: left
    width: (labels-width)%
    display: display-labels
    
  .sphera-group
    float: left
    width: (sphera-group-width)% 
    padding: 0px

  .binary-clock-group
    width: 220px
    padding: 15px

"""
