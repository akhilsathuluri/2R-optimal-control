(* ::Package:: *)

BeginPackage ["tools`"]
(* Defining tolerance *)
\[Epsilon] = 10^-10;

getangle\[Phi]::usage = "Gives you \[Phi] from both the trignometric functions"

eangle::usage ="Eliminates the required angle"

Coeff::usage ="gets coefficients from aCos[\[Theta]]+bSin[\[Theta]]+c = 0"

freudval::usage="It is used to get the lenghts of the links by solving synthesis problem using freudensteins method"

freudex::usage = "Used to derive the freudensteins equation for a given input and output angle configuration"

Begin["Private`"]

(************************************************************************)
Coeff[\[Eta]_,\[Phi]_] := 
Module[{a, b, c},
	 {a, b} = Simplify[Coefficient[\[Eta], {Cos[\[Phi]], Sin[\[Phi]]}]];
	  c = Simplify[\[Eta]/.{Sin[\[Phi]] -> 0, Cos[\[Phi]]-> 0}];

If[((!(realQ[a]) && NumericQ[a]) || (!(realQ[b]) && NumericQ[b]) || (!(realQ[c]) && NumericQ[c])),

Print[StringForm["The coefficients of sine and cosine functions in the equation are not real valued."]];
      ];
Return[{a, b, c}];
];
(***********************************************************************)



getangle\[Phi][\[Eta]_, \[Phi]_ ] := 
Module[{a, b, c, \[Beta], \[Lambda]}, 
{a, b, c} = Coeff[\[Eta], \[Phi]];
If[a^2+b^2 < \[Epsilon],
	If[c<\[Epsilon], (*all a =0, b=0, c=0 *)
		Print[StringForm["\[Theta] can take any value in (0, 2\[Pi])"]]
		Return[{{\[Phi]-> Interval[{0,2\[Pi]}]}}];,
		(*if a\[Equal]0, b\[Equal]0,but c\[NotEqual] 0 *)Print[StringForm["The given equation is inconsistent. No solution"]]
Return[{{}}];
];
];
\[Lambda] = ArcCos[-c/Sqrt[a^2+b^2]];
\[Beta] = ArcTan[a,b];
Return[{{\[Beta]+\[Lambda]}, {\[Beta]-\[Lambda]}}];
];
(************************************************************************)



eangle[{\[Eta]1_, \[Eta]2_}, \[Theta]_, \[Phi]_, cossin_:0]:=
Module[{a1, b1, c1, a2, b2, c2, det, elm, cos, sin, \[Eta], angle, num, den, temp, temp1}, 
{a1, b1, c1} = Coeff[\[Eta]1, \[Theta]];
{a2, b2, c2} = Coeff[\[Eta]2, \[Theta]];
det = a1*b2-a2*b1;
If[det < \[Epsilon], 
Print[StringForm["The equations are linearly dependant as the determinant is zero"]]];
cos = Together[(b1*c2-b2*c1)/(a1*b2-a2*b1)];
sin = Together[(a2*c1-a1*c2)/(a1*b2-a2*b1)];
temp1 = Together[cos^2+sin^2];
num = Numerator[temp1];
den = Denominator[temp1];
temp = num - den;
\[Eta] = TrigExpand[Simplify[Together[temp]]];
angle =  getangle\[Phi][\[Eta], \[Phi]];
Return[angle];
];
(***********************************************************************)




freudval[\[Theta]_, \[Phi]_] :=(*\[Theta] is the input and \[Phi] is the output*)
Module[{an, k1, k2, k3, \[Eta]1, \[Eta]2, \[Eta]3, k, \[Eta], C, l0, l1, l2, l3, l}, 
\[Eta]1 = k1*Cos[\[Theta][[1]]]+k2*Cos[\[Phi][[1]]]+k3 - Cos[\[Theta][[1]]-\[Phi][[1]]];
\[Eta]2 = k1*Cos[\[Theta][[2]]]+k2*Cos[\[Phi][[2]]]+k3 - Cos[\[Theta][[2]]-\[Phi][[2]]];
\[Eta]3 = k1*Cos[\[Theta][[3]]]+k2*Cos[\[Phi][[3]]]+k3 - Cos[\[Theta][[3]]-\[Phi][[3]]];
k = {{k1}, {k2}, {k3}};
C = {{Cos[\[Theta][[1]]], Cos[\[Phi][[1]]], 1}, {Cos[\[Theta][[2]]], Cos[\[Phi][[2]]], 1}, {Cos[\[Theta][[3]]], Cos[\[Phi][[3]]], 1}};
an = {{Cos[\[Theta][[1]]-\[Phi][[1]]]},{Cos[\[Theta][[2]]-\[Phi][[2]]]}, {Cos[\[Theta][[3]]-\[Phi][[3]]]}};
k = Inverse[C].an;
Return[N[Simplify[k]]];
];


freudex[\[Eta]_, \[Alpha]_, \[Phi]_, \[Theta]_] := (*\[Alpha] should be eliminated, \[Phi] is the input and \[Theta] is the output*)
Module[{ug, k1t, k2t, k3t, K, \[Eta]f, a1, b1, c1, a2, b2, c2, det, elm, cos, sin, angle, num, den, temp, temp1}, 
{a1, b1, c1} = Coeff[\[Eta][[1]], \[Alpha]];
{a2, b2, c2} = Coeff[\[Eta][[2]], \[Alpha]];
det = a1*b2-a2*b1;
cos = Together[(b1*c2-b2*c1)/(a1*b2-a2*b1)];
sin = Together[(a2*c1-a1*c2)/(a1*b2-a2*b1)];
temp1 = Together[cos^2+sin^2];
\[Eta]f = Simplify[Together[temp1]];
num = Numerator[temp1];
den = Denominator[temp1];
temp = Simplify[Together[num - den]];
ug = temp/.Cos[\[Phi]]->0/. Cos[\[Theta]]->0/. Cos[\[Theta]-\[Phi]]->0;
{k1t, k2t, k3t} = Coefficient[temp, {Cos[\[Phi]], Cos[\[Theta]], Cos[\[Theta]-\[Phi]]}];
K = {-k1t/k3t, -k2t/k3t, ug/(-k3t)};
Return[K];
(*Return[temp]*)
];



End[]
EndPackage[]
