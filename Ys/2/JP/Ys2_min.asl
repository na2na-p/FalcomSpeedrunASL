state("ys2c")
{
    byte roomID_F : 0x0026288, 0x0;
    float EnemyHP : 0x0006788, 0x14;
    byte roomID_H : 0x003EBF0, 0x0;}

start
{
    if(old.roomID_H == 199 && current.roomID_H == 200)
    {
    return true;
    }
}

split
{
    if(old.EnemyHP > 0 && current.EnemyHP <= 0 && current.roomID_F == 197)
    {
    return true;
    }
}