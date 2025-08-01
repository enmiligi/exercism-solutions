using System;

public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        bool signed;
        byte[] bytes;
        if (reading <= -2_147_483_649)
        {
            signed = true;
            bytes = BitConverter.GetBytes(reading);
        }
        else if (reading <= -32_769)
        {
            signed = true;
            bytes = BitConverter.GetBytes((int)reading);
        }
        else if (reading <= -1)
        {
            signed = true;
            bytes = BitConverter.GetBytes((short)reading);
        }
        else if (reading <= 65_535)
        {
            signed = false;
            bytes = BitConverter.GetBytes((ushort)reading);
        }
        else if (reading <= 2_147_483_647)
        {
            signed = true;
            bytes = BitConverter.GetBytes((int)reading);
        }
        else if (reading <= 4_294_967_295)
        {
            signed = false;
            bytes = BitConverter.GetBytes((uint)reading);
        }
        else
        {
            signed = true;
            bytes = BitConverter.GetBytes(reading);
        }
        byte prefix;
        if (signed)
        {
            prefix = (byte)(256 - bytes.Length);
        }
        else
        {
            prefix = (byte)bytes.Length;
        }
        byte[] result = new byte[9];
        result[0] = prefix;
        for (int i = 0; i < bytes.Length; i++)
        {
            result[i + 1] = bytes[i];
        }
        return result;
    }

    public static long FromBuffer(byte[] buffer)
    {
        byte length;
        bool signed;
        if (buffer[0] > 8)
        {
            length = (byte)(256 - buffer[0]);
            signed = true;
        }
        else
        {
            length = buffer[0];
            signed = false;
        }
        if (signed == true)
        {
            if (length == 2)
            {
                return BitConverter.ToInt16(buffer[1..3]);
            }
            else if (length == 4)
            {
                return BitConverter.ToInt32(buffer[1..5]);
            }
            else if (length == 8)
            {
                return BitConverter.ToInt64(buffer[1..9]);
            }
        }
        else
        {
            if (length == 2)
            {
                return BitConverter.ToUInt16(buffer[1..3]);
            }
            else if (length == 4)
            {
                return BitConverter.ToUInt32(buffer[1..5]);
            }
        }
        return 0;
    }
}
