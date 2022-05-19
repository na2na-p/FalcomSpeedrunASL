state("yso_win")
{
	byte is_displayHUD : 0x0014638, 0x0;
}


start
{
    if(old.is_displayHUD == 1 && current.is_displayHUD == 0)
{
return true;
}
}

split
{
    if(old.is_displayHUD == 0 && current.is_displayHUD == 1)
{
return true;
}
}