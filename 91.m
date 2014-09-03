(* Project Euler, Problem #91 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

dim = 50;
pointsAtOrigin = dim^2;
upwardsTriangles = Sum[
  pt2 = {x, y};
  {slopeX, slopeY} = {-y, x}/GCD[x, y];
  maxStepsX = If[-slopeX == 0, \[Infinity], Floor[x/(-slopeX)]];
  maxStepsY = Floor[(dim - y)/slopeY];
  Min[maxStepsX, maxStepsY]
  , {x, 1, dim}
  , {y, 0, dim}
 ];

result = pointsAtOrigin + 2*upwardsTriangles

(* Output *)

Print[result];
