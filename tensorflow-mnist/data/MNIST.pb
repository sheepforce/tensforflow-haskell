
0
x-inputPlaceholder*
shape: *
dtype0
;
zerosConst*
dtype0*
valueB	�
*    
Z
weightsVariable*
shape:	�
*
dtype0*
	container *
shared_name 
Z
weights/AssignAssignweightszeros*
use_locking(*
T0*
validate_shape(
*
weights/readIdentityweights*
T0
5
biasConst*
dtype0*
valueB
*    
V
VariableVariable*
shape:
*
dtype0*
	container *
shared_name 
[
Variable/AssignAssignVariablebias*
use_locking(*
T0*
validate_shape(
,
Variable/readIdentityVariable*
T0
[
Wx_b/MatMulMatMulx-inputweights/read*
transpose_a( *
transpose_b( *
T0
4
Wx_b/addAddWx_b/MatMulVariable/read*
T0
*
Wx_b/SoftmaxSoftmaxWx_b/add*
T0
D
HistogramSummary/tagConst*
dtype0*
valueB Bweights
Q
HistogramSummaryHistogramSummaryHistogramSummary/tagweights/read*
T0
E
HistogramSummary_1/tagConst*
dtype0*
valueB Bbiases
V
HistogramSummary_1HistogramSummaryHistogramSummary_1/tagVariable/read*
T0
@
HistogramSummary_2/tagConst*
dtype0*
value	B By
U
HistogramSummary_2HistogramSummaryHistogramSummary_2/tagWx_b/Softmax*
T0
0
y-inputPlaceholder*
shape: *
dtype0
&
xent/LogLogWx_b/Softmax*
T0
+
xent/mulMuly-inputxent/Log*
T0
$
	xent/RankRankxent/mul*
T0
:
xent/range/startConst*
dtype0*
value	B : 
:
xent/range/deltaConst*
dtype0*
value	B :
B

xent/rangeRangexent/range/start	xent/Rankxent/range/delta
?
xent/SumSumxent/mul
xent/range*
	keep_dims( *
T0
"
xent/NegNegxent/Sum*
T0
M
xent/ScalarSummary/tagsConst*
dtype0*
valueB Bcross entropy
O
xent/ScalarSummaryScalarSummaryxent/ScalarSummary/tagsxent/Neg*
T0
1
train/gradients/ShapeShapexent/Neg*
T0
B
train/gradients/ConstConst*
dtype0*
valueB
 *  �?
S
train/gradients/FillFilltrain/gradients/Shapetrain/gradients/Const*
T0
G
!train/gradients/xent/Neg_grad/NegNegtrain/gradients/Fill*
T0
?
#train/gradients/xent/Sum_grad/ShapeShapexent/mul*
T0
=
"train/gradients/xent/Sum_grad/RankRankxent/mul*
T0
C
%train/gradients/xent/Sum_grad/Shape_1Shape
xent/range*
T0
S
)train/gradients/xent/Sum_grad/range/startConst*
dtype0*
value	B : 
S
)train/gradients/xent/Sum_grad/range/deltaConst*
dtype0*
value	B :
�
#train/gradients/xent/Sum_grad/rangeRange)train/gradients/xent/Sum_grad/range/start"train/gradients/xent/Sum_grad/Rank)train/gradients/xent/Sum_grad/range/delta
R
(train/gradients/xent/Sum_grad/Fill/valueConst*
dtype0*
value	B :
�
"train/gradients/xent/Sum_grad/FillFill%train/gradients/xent/Sum_grad/Shape_1(train/gradients/xent/Sum_grad/Fill/value*
T0
�
+train/gradients/xent/Sum_grad/DynamicStitchDynamicStitch#train/gradients/xent/Sum_grad/range
xent/range#train/gradients/xent/Sum_grad/Shape"train/gradients/xent/Sum_grad/Fill*
N*
T0
�
&train/gradients/xent/Sum_grad/floordivDiv#train/gradients/xent/Sum_grad/Shape+train/gradients/xent/Sum_grad/DynamicStitch*
T0
�
%train/gradients/xent/Sum_grad/ReshapeReshape!train/gradients/xent/Neg_grad/Neg+train/gradients/xent/Sum_grad/DynamicStitch*
T0
�
"train/gradients/xent/Sum_grad/TileTile%train/gradients/xent/Sum_grad/Reshape&train/gradients/xent/Sum_grad/floordiv*
T0
>
#train/gradients/xent/mul_grad/ShapeShapey-input*
T0
A
%train/gradients/xent/mul_grad/Shape_1Shapexent/Log*
T0
�
3train/gradients/xent/mul_grad/BroadcastGradientArgsBroadcastGradientArgs#train/gradients/xent/mul_grad/Shape%train/gradients/xent/mul_grad/Shape_1
_
!train/gradients/xent/mul_grad/mulMul"train/gradients/xent/Sum_grad/Tilexent/Log*
T0
�
!train/gradients/xent/mul_grad/SumSum!train/gradients/xent/mul_grad/mul3train/gradients/xent/mul_grad/BroadcastGradientArgs*
	keep_dims( *
T0
�
%train/gradients/xent/mul_grad/ReshapeReshape!train/gradients/xent/mul_grad/Sum#train/gradients/xent/mul_grad/Shape*
T0
`
#train/gradients/xent/mul_grad/mul_1Muly-input"train/gradients/xent/Sum_grad/Tile*
T0
�
#train/gradients/xent/mul_grad/Sum_1Sum#train/gradients/xent/mul_grad/mul_15train/gradients/xent/mul_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0
�
'train/gradients/xent/mul_grad/Reshape_1Reshape#train/gradients/xent/mul_grad/Sum_1%train/gradients/xent/mul_grad/Shape_1*
T0
�
.train/gradients/xent/mul_grad/tuple/group_depsNoOp&^train/gradients/xent/mul_grad/Reshape(^train/gradients/xent/mul_grad/Reshape_1
�
6train/gradients/xent/mul_grad/tuple/control_dependencyIdentity%train/gradients/xent/mul_grad/Reshape/^train/gradients/xent/mul_grad/tuple/group_deps*
T0
�
8train/gradients/xent/mul_grad/tuple/control_dependency_1Identity'train/gradients/xent/mul_grad/Reshape_1/^train/gradients/xent/mul_grad/tuple/group_deps*
T0
?
!train/gradients/xent/Log_grad/InvInvWx_b/Softmax*
T0
�
!train/gradients/xent/Log_grad/mulMul8train/gradients/xent/mul_grad/tuple/control_dependency_1!train/gradients/xent/Log_grad/Inv*
T0
f
%train/gradients/Wx_b/Softmax_grad/mulMul!train/gradients/xent/Log_grad/mulWx_b/Softmax*
T0
e
7train/gradients/Wx_b/Softmax_grad/Sum/reduction_indicesConst*
dtype0*
valueB:
�
%train/gradients/Wx_b/Softmax_grad/SumSum%train/gradients/Wx_b/Softmax_grad/mul7train/gradients/Wx_b/Softmax_grad/Sum/reduction_indices*
	keep_dims( *
T0
d
/train/gradients/Wx_b/Softmax_grad/Reshape/shapeConst*
dtype0*
valueB"����   
�
)train/gradients/Wx_b/Softmax_grad/ReshapeReshape%train/gradients/Wx_b/Softmax_grad/Sum/train/gradients/Wx_b/Softmax_grad/Reshape/shape*
T0
�
%train/gradients/Wx_b/Softmax_grad/subSub!train/gradients/xent/Log_grad/mul)train/gradients/Wx_b/Softmax_grad/Reshape*
T0
l
'train/gradients/Wx_b/Softmax_grad/mul_1Mul%train/gradients/Wx_b/Softmax_grad/subWx_b/Softmax*
T0
B
#train/gradients/Wx_b/add_grad/ShapeShapeWx_b/MatMul*
T0
F
%train/gradients/Wx_b/add_grad/Shape_1ShapeVariable/read*
T0
�
3train/gradients/Wx_b/add_grad/BroadcastGradientArgsBroadcastGradientArgs#train/gradients/Wx_b/add_grad/Shape%train/gradients/Wx_b/add_grad/Shape_1
�
!train/gradients/Wx_b/add_grad/SumSum'train/gradients/Wx_b/Softmax_grad/mul_13train/gradients/Wx_b/add_grad/BroadcastGradientArgs*
	keep_dims( *
T0
�
%train/gradients/Wx_b/add_grad/ReshapeReshape!train/gradients/Wx_b/add_grad/Sum#train/gradients/Wx_b/add_grad/Shape*
T0
�
#train/gradients/Wx_b/add_grad/Sum_1Sum'train/gradients/Wx_b/Softmax_grad/mul_15train/gradients/Wx_b/add_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0
�
'train/gradients/Wx_b/add_grad/Reshape_1Reshape#train/gradients/Wx_b/add_grad/Sum_1%train/gradients/Wx_b/add_grad/Shape_1*
T0
�
.train/gradients/Wx_b/add_grad/tuple/group_depsNoOp&^train/gradients/Wx_b/add_grad/Reshape(^train/gradients/Wx_b/add_grad/Reshape_1
�
6train/gradients/Wx_b/add_grad/tuple/control_dependencyIdentity%train/gradients/Wx_b/add_grad/Reshape/^train/gradients/Wx_b/add_grad/tuple/group_deps*
T0
�
8train/gradients/Wx_b/add_grad/tuple/control_dependency_1Identity'train/gradients/Wx_b/add_grad/Reshape_1/^train/gradients/Wx_b/add_grad/tuple/group_deps*
T0
�
'train/gradients/Wx_b/MatMul_grad/MatMulMatMul6train/gradients/Wx_b/add_grad/tuple/control_dependencyweights/read*
transpose_a( *
transpose_b(*
T0
�
)train/gradients/Wx_b/MatMul_grad/MatMul_1MatMulx-input6train/gradients/Wx_b/add_grad/tuple/control_dependency*
transpose_a(*
transpose_b( *
T0
�
1train/gradients/Wx_b/MatMul_grad/tuple/group_depsNoOp(^train/gradients/Wx_b/MatMul_grad/MatMul*^train/gradients/Wx_b/MatMul_grad/MatMul_1
�
9train/gradients/Wx_b/MatMul_grad/tuple/control_dependencyIdentity'train/gradients/Wx_b/MatMul_grad/MatMul2^train/gradients/Wx_b/MatMul_grad/tuple/group_deps*
T0
�
;train/gradients/Wx_b/MatMul_grad/tuple/control_dependency_1Identity)train/gradients/Wx_b/MatMul_grad/MatMul_12^train/gradients/Wx_b/MatMul_grad/tuple/group_deps*
T0
P
#train/GradientDescent/learning_rateConst*
dtype0*
valueB
 *
�#<
�
9train/GradientDescent/update_weights/ApplyGradientDescentApplyGradientDescentweights#train/GradientDescent/learning_rate;train/gradients/Wx_b/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0
�
:train/GradientDescent/update_Variable/ApplyGradientDescentApplyGradientDescentVariable#train/GradientDescent/learning_rate8train/gradients/Wx_b/add_grad/tuple/control_dependency_1*
use_locking( *
T0
�
train/GradientDescentNoOp:^train/GradientDescent/update_weights/ApplyGradientDescent;^train/GradientDescent/update_Variable/ApplyGradientDescent
?
test/ArgMax/dimensionConst*
dtype0*
value	B :
C
test/ArgMaxArgMaxWx_b/Softmaxtest/ArgMax/dimension*
T0
A
test/ArgMax_1/dimensionConst*
dtype0*
value	B :
B
test/ArgMax_1ArgMaxy-inputtest/ArgMax_1/dimension*
T0
8

test/EqualEqualtest/ArgMaxtest/ArgMax_1*
T0	
5
	test/CastCast
test/Equal*

DstT0*

SrcT0

%
	test/RankRank	test/Cast*
T0
:
test/range/startConst*
dtype0*
value	B : 
:
test/range/deltaConst*
dtype0*
value	B :
B

test/rangeRangetest/range/start	test/Ranktest/range/delta
B
	test/MeanMean	test/Cast
test/range*
	keep_dims( *
T0
H
test/ScalarSummary/tagsConst*
dtype0*
valueB Baccuracy
P
test/ScalarSummaryScalarSummarytest/ScalarSummary/tags	test/Mean*
T0
�
MergeSummary/MergeSummaryMergeSummaryHistogramSummaryHistogramSummary_1HistogramSummary_2xent/ScalarSummarytest/ScalarSummary*
N
/
initNoOp^weights/Assign^Variable/Assign