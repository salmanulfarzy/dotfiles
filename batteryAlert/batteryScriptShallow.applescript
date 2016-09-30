set Cap to (do shell script "ioreg -w0 -l | grep ExternalChargeCapable")
tell Cap to set {wallPower} to {last word of paragraph 1}
set Cap to (do shell script "ioreg -wO -l | grep Capacity")
tell Cap to set {Available, Max} to {last word of paragraph 2, last word of paragraph 1}
set Pct to round (100 * Available / Max)
  if wallPower = "Yes" then
  if Pct >= 90 then
  set volume 100
  do shell script "say -v \"Samantha\" \"Shallow Charging Complete\" "
  end if
  else
  if Pct ² 40 then
  set volume 100
  do shell script "say -v \"Samantha\" \"Shallow Charge Now\" "
  end if
  end if
