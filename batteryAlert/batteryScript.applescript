set Cap to (do shell script "ioreg -w0 -l | grep ExternalChargeCapable")
tell Cap to set {wallPower} to {last word of paragraph 1}
set Cap to (do shell script "ioreg -wO -l | grep Capacity")
tell Cap to set {Available, Max} to {last word of paragraph 2, last word of paragraph 1}
set Pct to round (100 * Available / Max)
  if wallPower = "Yes" then
  if Pct = 100 then
  set volume 100
  do shell script "say -v \"Samantha\" \"BATTERY FULL\" "
  end if
  else
  if Pct ² 6 then
  set volume 100
  do shell script "say -v \"Samantha\" \"LOW BATTERY\" "
  if Pct ² 4 then
  beep 5
  do shell script "say -v \"Samatha\" \"PLUG ME IN NOW\""
  end if
  end if
  end if
