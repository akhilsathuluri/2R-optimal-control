(* ::Package:: *)

BeginPackage["tools2R`",{"tools`"}]


tools2R::usage = " '2R_tools' package povides the following functions"


fk2R::usage = "Takes in the origin and angles of the links and gives the position of the end-effector"
ik2R::usage = "Takes in the origin and the tool tip positions and finds all suitable angle configurations to reach the given point"


Begin["`Private`"]; 


fk2R[{x0_,y0_},l1_,l2_,{\[Theta]1_,\[Theta]2_}]:=
	Module[{sol},
		sol = {x0+l1*Cos[\[Theta]1]+l2*Cos[\[Theta]1+\[Theta]2],y0+l1*Sin[\[Theta]1]+l2*Sin[\[Theta]1+\[Theta]2]};
		Return[sol];
];


ik2R[{x0_,y0_},l1_,l2_,{x_,y_}]:=
	Module[{\[Theta]1,\[Theta]12,\[Eta]1,\[Eta]2,angle\[Theta]1,angle\[Theta]2,angles},
		\[Eta]1 = l1*Cos[\[Theta]1]+l2*Cos[\[Theta]12]+x0-x;
		\[Eta]2 = l1*Sin[\[Theta]1]+l2*Sin[\[Theta]12]+y0-y;
		angle\[Theta]1 = eangle[{\[Eta]1,\[Eta]2},\[Theta]12,\[Theta]1];
		angle\[Theta]2 = {ArcTan[{x-x0-l1*Cos[angle\[Theta]1[[1]]]},y-y0-l1*Sin[angle\[Theta]1[[1]]]],ArcTan[{x-x0-l1*Cos[angle\[Theta]1[[2]]]},y-y0-l1*Sin[angle\[Theta]1[[2]]]]};
		angles = {angle\[Theta]1,angle\[Theta]2};
		Return[angles];
];


End[]
EndPackage[]
