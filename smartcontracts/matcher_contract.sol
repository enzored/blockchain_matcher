// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.8.0;
contract Matcher {

    bool public isMatch;
    int public pub_total;

    function sqrt(int x) public pure returns (int y)
    {
        int z = int((x + 1) / 2);
        y = x;
        while (z < y)
        {
            y = z;
            z = (x / z + z) / 2;
        }
    }

    function abs(int x) private pure returns (int)
    {
        return x >= 0 ? x : -x;
    }


   function euclidean_distance(int[128] memory _bio1, int[128] memory _bio2) public// returns (int)
   {
       int total = 0;
       for (uint i=0; i<_bio1.length; i++)
       {
           int diff = _bio1[i] - _bio2[i];
           total += diff * diff;
       }

       if (sqrt(total) <= 60)
       {
           isMatch = true;
       }
       else
       {
          isMatch = false;
       }
   }

    function manhattan_distance(int[128] memory _bio1, int[128] memory _bio2) public
    {
        int total = 0;
        for (uint i=0; i<_bio1.length; i++)
        {
           total += abs(_bio1[i] - _bio2[i]);
        }

        if (total <= 552)
        {
            isMatch = true;
        }
        else
        {
            isMatch = false;
        }
    }




    function canberra_distance(int[128] memory _bio1, int[128] memory _bio2) public
    {
        int total = 0;
        for (uint i=0; i<_bio1.length; i++)
        {
            int nom = abs(_bio1[i] - _bio2[i]);
            int denom = abs(_bio1[i]) + abs(_bio2[i]);
            if (denom == 0)
            {
                continue;
            }
            total += nom/denom;
        }
        pub_total = total;
        if (total <= 26)
        {
            isMatch = true;
        }
        else
        {
            isMatch = false;
        }
    }

    function chebyshev_distance(int[128] memory _bio1, int[128] memory _bio2) public
    {
        int max = 0;
        for (uint i=0; i<_bio1.length; i++)
        {
            if (abs(_bio1[i] - _bio2 [i]) > max)
            {
                max = abs(_bio1[i] - _bio2 [i]);
            }
        }

        if (max <= 14)
        {
            isMatch = true;
        }

        else
        {
            isMatch = false;
        }
    }
}

