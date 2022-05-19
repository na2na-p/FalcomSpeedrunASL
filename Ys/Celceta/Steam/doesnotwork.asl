state("Ysc_dx11")
{
	byte TempValue1 : 0x0089528, 0x0;
	byte TempValue2 : 0x00AF588, 0x0;
	byte TempValue3 : 0x0031908, 0x0;
}


split
{
	if(old.TempValue1 == 10 && current.TempValue1 == 10 && old.TempValue2 == 14 && current.TempValue2 == 16 && old.TempValue3 == 12 && current.TempValue3 == 23);
{
return true;
}
}