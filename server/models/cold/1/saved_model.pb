¿
Ö
:
Add
x"T
y"T
z"T"
Ttype:
2	

ArgMax

input"T
	dimension"Tidx
output"output_type"!
Ttype:
2	
"
Tidxtype0:
2	"
output_typetype0	:
2	
B
AssignVariableOp
resource
value"dtype"
dtypetype
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
­
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
º
If
cond"Tcond
input2Tin
output2Tout"
Tcondtype"
Tin
list(type)("
Tout
list(type)("
then_branchfunc"
else_branchfunc" 
output_shapeslist(shape)
 
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(
=
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	
@
ReadVariableOp
resource
value"dtype"
dtypetype
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
;
Sub
x"T
y"T
z"T"
Ttype:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 
9
VarIsInitializedOp
resource
is_initialized
"serve*2.3.42v2.3.3-137-gea90cf44f738ª

global_step/Initializer/zerosConst*
_class
loc:@global_step*
_output_shapes
: *
dtype0	*
value	B	 R 

global_stepVarHandleOp*
_class
loc:@global_step*
_output_shapes
: *
dtype0	*
shape: *
shared_nameglobal_step
g
,global_step/IsInitialized/VarIsInitializedOpVarIsInitializedOpglobal_step*
_output_shapes
: 
_
global_step/AssignAssignVariableOpglobal_stepglobal_step/Initializer/zeros*
dtype0	
c
global_step/Read/ReadVariableOpReadVariableOpglobal_step*
_output_shapes
: *
dtype0	
o
input_tensorPlaceholder*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ
n
dense_inputPlaceholder*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0*
shape:ÿÿÿÿÿÿÿÿÿ

-dense/kernel/Initializer/random_uniform/shapeConst*
_class
loc:@dense/kernel*
_output_shapes
:*
dtype0*
valueB"      

+dense/kernel/Initializer/random_uniform/minConst*
_class
loc:@dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ø½

+dense/kernel/Initializer/random_uniform/maxConst*
_class
loc:@dense/kernel*
_output_shapes
: *
dtype0*
valueB
 *Ø=
Í
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
T0*
_class
loc:@dense/kernel*
_output_shapes
:	*
dtype0
Î
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
: 
á
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel*
_output_shapes
:	
Ó
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel*
_output_shapes
:	

dense/kernelVarHandleOp*
_class
loc:@dense/kernel*
_output_shapes
: *
dtype0*
shape:	*
shared_namedense/kernel
i
-dense/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense/kernel*
_output_shapes
: 
k
dense/kernel/AssignAssignVariableOpdense/kernel'dense/kernel/Initializer/random_uniform*
dtype0
n
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes
:	*
dtype0

dense/bias/Initializer/zerosConst*
_class
loc:@dense/bias*
_output_shapes	
:*
dtype0*
valueB*    


dense/biasVarHandleOp*
_class
loc:@dense/bias*
_output_shapes
: *
dtype0*
shape:*
shared_name
dense/bias
e
+dense/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOp
dense/bias*
_output_shapes
: 
\
dense/bias/AssignAssignVariableOp
dense/biasdense/bias/Initializer/zeros*
dtype0
f
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes	
:*
dtype0
i
dense/MatMul/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes
:	*
dtype0
s
dense/MatMulMatMuldense_inputdense/MatMul/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
d
dense/BiasAdd/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes	
:*
dtype0
w
dense/BiasAddBiasAdddense/MatMuldense/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
T

dense/ReluReludense/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
\
keras_learning_phase/inputConst*
_output_shapes
: *
dtype0
*
value	B
 Z 
|
keras_learning_phasePlaceholderWithDefaultkeras_learning_phase/input*
_output_shapes
: *
dtype0
*
shape: 
ð
dropout/condIfkeras_learning_phase
dense/Relu*
Tcond0
*
Tin
2*
Tout

2*
_lower_using_switch_merge(*6
_output_shapes$
":ÿÿÿÿÿÿÿÿÿ: : : : : : : * 
_read_only_resource_inputs
 *+
else_branchR
dropout_cond_false_95629*5
output_shapes$
":ÿÿÿÿÿÿÿÿÿ: : : : : : : **
then_branchR
dropout_cond_true_95628
b
dropout/cond/IdentityIdentitydropout/cond*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
T
dropout/cond/Identity_1Identitydropout/cond:1*
T0*
_output_shapes
: 
T
dropout/cond/Identity_2Identitydropout/cond:2*
T0*
_output_shapes
: 
T
dropout/cond/Identity_3Identitydropout/cond:3*
T0*
_output_shapes
: 
T
dropout/cond/Identity_4Identitydropout/cond:4*
T0*
_output_shapes
: 
T
dropout/cond/Identity_5Identitydropout/cond:5*
T0*
_output_shapes
: 
T
dropout/cond/Identity_6Identitydropout/cond:6*
T0*
_output_shapes
: 
T
dropout/cond/Identity_7Identitydropout/cond:7*
T0*
_output_shapes
: 
£
/dense_1/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_1/kernel*
_output_shapes
:*
dtype0*
valueB"      

-dense_1/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *óµ½

-dense_1/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_1/kernel*
_output_shapes
: *
dtype0*
valueB
 *óµ=
Ô
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_1/kernel* 
_output_shapes
:
*
dtype0
Ö
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel*
_output_shapes
: 
ê
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel* 
_output_shapes
:

Ü
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel* 
_output_shapes
:


dense_1/kernelVarHandleOp*!
_class
loc:@dense_1/kernel*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_1/kernel
m
/dense_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/kernel*
_output_shapes
: 
q
dense_1/kernel/AssignAssignVariableOpdense_1/kernel)dense_1/kernel/Initializer/random_uniform*
dtype0
s
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel* 
_output_shapes
:
*
dtype0

dense_1/bias/Initializer/zerosConst*
_class
loc:@dense_1/bias*
_output_shapes	
:*
dtype0*
valueB*    

dense_1/biasVarHandleOp*
_class
loc:@dense_1/bias*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_1/bias
i
-dense_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_1/bias*
_output_shapes
: 
b
dense_1/bias/AssignAssignVariableOpdense_1/biasdense_1/bias/Initializer/zeros*
dtype0
j
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:*
dtype0
n
dense_1/MatMul/ReadVariableOpReadVariableOpdense_1/kernel* 
_output_shapes
:
*
dtype0

dense_1/MatMulMatMuldropout/cond/Identitydense_1/MatMul/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
h
dense_1/BiasAdd/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:*
dtype0
}
dense_1/BiasAddBiasAdddense_1/MatMuldense_1/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
X
dense_1/ReluReludense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ø
dropout_1/condIfkeras_learning_phasedense_1/Relu*
Tcond0
*
Tin
2*
Tout

2*
_lower_using_switch_merge(*6
_output_shapes$
":ÿÿÿÿÿÿÿÿÿ: : : : : : : * 
_read_only_resource_inputs
 *-
else_branchR
dropout_1_cond_false_95693*5
output_shapes$
":ÿÿÿÿÿÿÿÿÿ: : : : : : : *,
then_branchR
dropout_1_cond_true_95692
f
dropout_1/cond/IdentityIdentitydropout_1/cond*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
X
dropout_1/cond/Identity_1Identitydropout_1/cond:1*
T0*
_output_shapes
: 
X
dropout_1/cond/Identity_2Identitydropout_1/cond:2*
T0*
_output_shapes
: 
X
dropout_1/cond/Identity_3Identitydropout_1/cond:3*
T0*
_output_shapes
: 
X
dropout_1/cond/Identity_4Identitydropout_1/cond:4*
T0*
_output_shapes
: 
X
dropout_1/cond/Identity_5Identitydropout_1/cond:5*
T0*
_output_shapes
: 
X
dropout_1/cond/Identity_6Identitydropout_1/cond:6*
T0*
_output_shapes
: 
X
dropout_1/cond/Identity_7Identitydropout_1/cond:7*
T0*
_output_shapes
: 
£
/dense_2/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_2/kernel*
_output_shapes
:*
dtype0*
valueB"      

-dense_2/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *   ¾

-dense_2/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_2/kernel*
_output_shapes
: *
dtype0*
valueB
 *   >
Ô
7dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_2/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_2/kernel* 
_output_shapes
:
*
dtype0
Ö
-dense_2/kernel/Initializer/random_uniform/subSub-dense_2/kernel/Initializer/random_uniform/max-dense_2/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_2/kernel*
_output_shapes
: 
ê
-dense_2/kernel/Initializer/random_uniform/mulMul7dense_2/kernel/Initializer/random_uniform/RandomUniform-dense_2/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_2/kernel* 
_output_shapes
:

Ü
)dense_2/kernel/Initializer/random_uniformAdd-dense_2/kernel/Initializer/random_uniform/mul-dense_2/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_2/kernel* 
_output_shapes
:


dense_2/kernelVarHandleOp*!
_class
loc:@dense_2/kernel*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_2/kernel
m
/dense_2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_2/kernel*
_output_shapes
: 
q
dense_2/kernel/AssignAssignVariableOpdense_2/kernel)dense_2/kernel/Initializer/random_uniform*
dtype0
s
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel* 
_output_shapes
:
*
dtype0

dense_2/bias/Initializer/zerosConst*
_class
loc:@dense_2/bias*
_output_shapes	
:*
dtype0*
valueB*    

dense_2/biasVarHandleOp*
_class
loc:@dense_2/bias*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_2/bias
i
-dense_2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_2/bias*
_output_shapes
: 
b
dense_2/bias/AssignAssignVariableOpdense_2/biasdense_2/bias/Initializer/zeros*
dtype0
j
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes	
:*
dtype0
n
dense_2/MatMul/ReadVariableOpReadVariableOpdense_2/kernel* 
_output_shapes
:
*
dtype0

dense_2/MatMulMatMuldropout_1/cond/Identitydense_2/MatMul/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
h
dense_2/BiasAdd/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes	
:*
dtype0
}
dense_2/BiasAddBiasAdddense_2/MatMuldense_2/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
X
dense_2/ReluReludense_2/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ø
dropout_2/condIfkeras_learning_phasedense_2/Relu*
Tcond0
*
Tin
2*
Tout

2*
_lower_using_switch_merge(*6
_output_shapes$
":ÿÿÿÿÿÿÿÿÿ: : : : : : : * 
_read_only_resource_inputs
 *-
else_branchR
dropout_2_cond_false_95757*5
output_shapes$
":ÿÿÿÿÿÿÿÿÿ: : : : : : : *,
then_branchR
dropout_2_cond_true_95756
f
dropout_2/cond/IdentityIdentitydropout_2/cond*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
X
dropout_2/cond/Identity_1Identitydropout_2/cond:1*
T0*
_output_shapes
: 
X
dropout_2/cond/Identity_2Identitydropout_2/cond:2*
T0*
_output_shapes
: 
X
dropout_2/cond/Identity_3Identitydropout_2/cond:3*
T0*
_output_shapes
: 
X
dropout_2/cond/Identity_4Identitydropout_2/cond:4*
T0*
_output_shapes
: 
X
dropout_2/cond/Identity_5Identitydropout_2/cond:5*
T0*
_output_shapes
: 
X
dropout_2/cond/Identity_6Identitydropout_2/cond:6*
T0*
_output_shapes
: 
X
dropout_2/cond/Identity_7Identitydropout_2/cond:7*
T0*
_output_shapes
: 
£
/dense_3/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_3/kernel*
_output_shapes
:*
dtype0*
valueB"   @   

-dense_3/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *ó5¾

-dense_3/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_3/kernel*
_output_shapes
: *
dtype0*
valueB
 *ó5>
Ó
7dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_3/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes
:	@*
dtype0
Ö
-dense_3/kernel/Initializer/random_uniform/subSub-dense_3/kernel/Initializer/random_uniform/max-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes
: 
é
-dense_3/kernel/Initializer/random_uniform/mulMul7dense_3/kernel/Initializer/random_uniform/RandomUniform-dense_3/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes
:	@
Û
)dense_3/kernel/Initializer/random_uniformAdd-dense_3/kernel/Initializer/random_uniform/mul-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel*
_output_shapes
:	@

dense_3/kernelVarHandleOp*!
_class
loc:@dense_3/kernel*
_output_shapes
: *
dtype0*
shape:	@*
shared_namedense_3/kernel
m
/dense_3/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_3/kernel*
_output_shapes
: 
q
dense_3/kernel/AssignAssignVariableOpdense_3/kernel)dense_3/kernel/Initializer/random_uniform*
dtype0
r
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes
:	@*
dtype0

dense_3/bias/Initializer/zerosConst*
_class
loc:@dense_3/bias*
_output_shapes
:@*
dtype0*
valueB@*    

dense_3/biasVarHandleOp*
_class
loc:@dense_3/bias*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_3/bias
i
-dense_3/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_3/bias*
_output_shapes
: 
b
dense_3/bias/AssignAssignVariableOpdense_3/biasdense_3/bias/Initializer/zeros*
dtype0
i
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:@*
dtype0
m
dense_3/MatMul/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes
:	@*
dtype0

dense_3/MatMulMatMuldropout_2/cond/Identitydense_3/MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
g
dense_3/BiasAdd/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:@*
dtype0
|
dense_3/BiasAddBiasAdddense_3/MatMuldense_3/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
W
dense_3/ReluReludense_3/BiasAdd*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
ö
dropout_3/condIfkeras_learning_phasedense_3/Relu*
Tcond0
*
Tin
2*
Tout

2*
_lower_using_switch_merge(*5
_output_shapes#
!:ÿÿÿÿÿÿÿÿÿ@: : : : : : : * 
_read_only_resource_inputs
 *-
else_branchR
dropout_3_cond_false_95821*4
output_shapes#
!:ÿÿÿÿÿÿÿÿÿ@: : : : : : : *,
then_branchR
dropout_3_cond_true_95820
e
dropout_3/cond/IdentityIdentitydropout_3/cond*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
X
dropout_3/cond/Identity_1Identitydropout_3/cond:1*
T0*
_output_shapes
: 
X
dropout_3/cond/Identity_2Identitydropout_3/cond:2*
T0*
_output_shapes
: 
X
dropout_3/cond/Identity_3Identitydropout_3/cond:3*
T0*
_output_shapes
: 
X
dropout_3/cond/Identity_4Identitydropout_3/cond:4*
T0*
_output_shapes
: 
X
dropout_3/cond/Identity_5Identitydropout_3/cond:5*
T0*
_output_shapes
: 
X
dropout_3/cond/Identity_6Identitydropout_3/cond:6*
T0*
_output_shapes
: 
X
dropout_3/cond/Identity_7Identitydropout_3/cond:7*
T0*
_output_shapes
: 
£
/dense_4/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_4/kernel*
_output_shapes
:*
dtype0*
valueB"@       

-dense_4/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *  ¾

-dense_4/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_4/kernel*
_output_shapes
: *
dtype0*
valueB
 *  >
Ò
7dense_4/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_4/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_4/kernel*
_output_shapes

:@ *
dtype0
Ö
-dense_4/kernel/Initializer/random_uniform/subSub-dense_4/kernel/Initializer/random_uniform/max-dense_4/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_4/kernel*
_output_shapes
: 
è
-dense_4/kernel/Initializer/random_uniform/mulMul7dense_4/kernel/Initializer/random_uniform/RandomUniform-dense_4/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_4/kernel*
_output_shapes

:@ 
Ú
)dense_4/kernel/Initializer/random_uniformAdd-dense_4/kernel/Initializer/random_uniform/mul-dense_4/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_4/kernel*
_output_shapes

:@ 

dense_4/kernelVarHandleOp*!
_class
loc:@dense_4/kernel*
_output_shapes
: *
dtype0*
shape
:@ *
shared_namedense_4/kernel
m
/dense_4/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_4/kernel*
_output_shapes
: 
q
dense_4/kernel/AssignAssignVariableOpdense_4/kernel)dense_4/kernel/Initializer/random_uniform*
dtype0
q
"dense_4/kernel/Read/ReadVariableOpReadVariableOpdense_4/kernel*
_output_shapes

:@ *
dtype0

dense_4/bias/Initializer/zerosConst*
_class
loc:@dense_4/bias*
_output_shapes
: *
dtype0*
valueB *    

dense_4/biasVarHandleOp*
_class
loc:@dense_4/bias*
_output_shapes
: *
dtype0*
shape: *
shared_namedense_4/bias
i
-dense_4/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_4/bias*
_output_shapes
: 
b
dense_4/bias/AssignAssignVariableOpdense_4/biasdense_4/bias/Initializer/zeros*
dtype0
i
 dense_4/bias/Read/ReadVariableOpReadVariableOpdense_4/bias*
_output_shapes
: *
dtype0
l
dense_4/MatMul/ReadVariableOpReadVariableOpdense_4/kernel*
_output_shapes

:@ *
dtype0

dense_4/MatMulMatMuldropout_3/cond/Identitydense_4/MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
g
dense_4/BiasAdd/ReadVariableOpReadVariableOpdense_4/bias*
_output_shapes
: *
dtype0
|
dense_4/BiasAddBiasAdddense_4/MatMuldense_4/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
W
dense_4/ReluReludense_4/BiasAdd*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
£
/dense_5/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_5/kernel*
_output_shapes
:*
dtype0*
valueB"       

-dense_5/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_5/kernel*
_output_shapes
: *
dtype0*
valueB
 *½¾

-dense_5/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_5/kernel*
_output_shapes
: *
dtype0*
valueB
 *½>
Ò
7dense_5/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_5/kernel/Initializer/random_uniform/shape*
T0*!
_class
loc:@dense_5/kernel*
_output_shapes

: *
dtype0
Ö
-dense_5/kernel/Initializer/random_uniform/subSub-dense_5/kernel/Initializer/random_uniform/max-dense_5/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_5/kernel*
_output_shapes
: 
è
-dense_5/kernel/Initializer/random_uniform/mulMul7dense_5/kernel/Initializer/random_uniform/RandomUniform-dense_5/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_5/kernel*
_output_shapes

: 
Ú
)dense_5/kernel/Initializer/random_uniformAdd-dense_5/kernel/Initializer/random_uniform/mul-dense_5/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_5/kernel*
_output_shapes

: 

dense_5/kernelVarHandleOp*!
_class
loc:@dense_5/kernel*
_output_shapes
: *
dtype0*
shape
: *
shared_namedense_5/kernel
m
/dense_5/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_5/kernel*
_output_shapes
: 
q
dense_5/kernel/AssignAssignVariableOpdense_5/kernel)dense_5/kernel/Initializer/random_uniform*
dtype0
q
"dense_5/kernel/Read/ReadVariableOpReadVariableOpdense_5/kernel*
_output_shapes

: *
dtype0

dense_5/bias/Initializer/zerosConst*
_class
loc:@dense_5/bias*
_output_shapes
:*
dtype0*
valueB*    

dense_5/biasVarHandleOp*
_class
loc:@dense_5/bias*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_5/bias
i
-dense_5/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpdense_5/bias*
_output_shapes
: 
b
dense_5/bias/AssignAssignVariableOpdense_5/biasdense_5/bias/Initializer/zeros*
dtype0
i
 dense_5/bias/Read/ReadVariableOpReadVariableOpdense_5/bias*
_output_shapes
:*
dtype0
l
dense_5/MatMul/ReadVariableOpReadVariableOpdense_5/kernel*
_output_shapes

: *
dtype0
w
dense_5/MatMulMatMuldense_4/Reludense_5/MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
g
dense_5/BiasAdd/ReadVariableOpReadVariableOpdense_5/bias*
_output_shapes
:*
dtype0
|
dense_5/BiasAddBiasAdddense_5/MatMuldense_5/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
]
dense_5/SoftmaxSoftmaxdense_5/BiasAdd*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
t
&sequential/dense/MatMul/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes
:	*
dtype0

sequential/dense/MatMulMatMulinput_tensor&sequential/dense/MatMul/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
o
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes	
:*
dtype0

sequential/dense/BiasAddBiasAddsequential/dense/MatMul'sequential/dense/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
j
sequential/dense/ReluRelusequential/dense/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
q
sequential/dropout/IdentityIdentitysequential/dense/Relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
y
(sequential/dense_1/MatMul/ReadVariableOpReadVariableOpdense_1/kernel* 
_output_shapes
:
*
dtype0

sequential/dense_1/MatMulMatMulsequential/dropout/Identity(sequential/dense_1/MatMul/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
s
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:*
dtype0

sequential/dense_1/BiasAddBiasAddsequential/dense_1/MatMul)sequential/dense_1/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
n
sequential/dense_1/ReluRelusequential/dense_1/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
u
sequential/dropout_1/IdentityIdentitysequential/dense_1/Relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
y
(sequential/dense_2/MatMul/ReadVariableOpReadVariableOpdense_2/kernel* 
_output_shapes
:
*
dtype0

sequential/dense_2/MatMulMatMulsequential/dropout_1/Identity(sequential/dense_2/MatMul/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
s
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes	
:*
dtype0

sequential/dense_2/BiasAddBiasAddsequential/dense_2/MatMul)sequential/dense_2/BiasAdd/ReadVariableOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
n
sequential/dense_2/ReluRelusequential/dense_2/BiasAdd*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
u
sequential/dropout_2/IdentityIdentitysequential/dense_2/Relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
x
(sequential/dense_3/MatMul/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes
:	@*
dtype0

sequential/dense_3/MatMulMatMulsequential/dropout_2/Identity(sequential/dense_3/MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
r
)sequential/dense_3/BiasAdd/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes
:@*
dtype0

sequential/dense_3/BiasAddBiasAddsequential/dense_3/MatMul)sequential/dense_3/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
m
sequential/dense_3/ReluRelusequential/dense_3/BiasAdd*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
t
sequential/dropout_3/IdentityIdentitysequential/dense_3/Relu*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
w
(sequential/dense_4/MatMul/ReadVariableOpReadVariableOpdense_4/kernel*
_output_shapes

:@ *
dtype0

sequential/dense_4/MatMulMatMulsequential/dropout_3/Identity(sequential/dense_4/MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
r
)sequential/dense_4/BiasAdd/ReadVariableOpReadVariableOpdense_4/bias*
_output_shapes
: *
dtype0

sequential/dense_4/BiasAddBiasAddsequential/dense_4/MatMul)sequential/dense_4/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
m
sequential/dense_4/ReluRelusequential/dense_4/BiasAdd*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ 
w
(sequential/dense_5/MatMul/ReadVariableOpReadVariableOpdense_5/kernel*
_output_shapes

: *
dtype0

sequential/dense_5/MatMulMatMulsequential/dense_4/Relu(sequential/dense_5/MatMul/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
r
)sequential/dense_5/BiasAdd/ReadVariableOpReadVariableOpdense_5/bias*
_output_shapes
:*
dtype0

sequential/dense_5/BiasAddBiasAddsequential/dense_5/MatMul)sequential/dense_5/BiasAdd/ReadVariableOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
s
sequential/dense_5/SoftmaxSoftmaxsequential/dense_5/BiasAdd*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
R
ArgMax/dimensionConst*
_output_shapes
: *
dtype0*
value	B :
l
ArgMaxArgMaxsequential/dense_5/SoftmaxArgMax/dimension*
T0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

ConstConst*
_output_shapes
:*
dtype0*`
valueWBUB	EPSB_0011B	EPSB_0012B	EPSB_0013B	EPSB_0014B	EPSB_0015B	EPSB_0016B	EPSB_0017
O
GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 

GatherV2GatherV2ConstArgMaxGatherV2/axis*
Taxis0*
Tindices0	*
Tparams0*#
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
Y
save/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
_output_shapes
: *
dtype0*
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
_output_shapes
: *
dtype0*
shape: 
{
save/StaticRegexFullMatchStaticRegexFullMatch
save/Const"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*
a
save/Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part

save/Const_2Const"/device:CPU:**
_output_shapes
: *
dtype0*<
value3B1 B+_temp_759d0d64efea4e7ba9c48b651c4ab3ac/part
|
save/SelectSelectsave/StaticRegexFullMatchsave/Const_1save/Const_2"/device:CPU:**
T0*
_output_shapes
: 
f
save/StringJoin
StringJoin
save/Constsave/Select"/device:CPU:**
N*
_output_shapes
: 
Q
save/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
®
save/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*Ò
valueÈBÅB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBdense_2/biasBdense_2/kernelBdense_3/biasBdense_3/kernelBdense_4/biasBdense_4/kernelBdense_5/biasBdense_5/kernelBglobal_step

save/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*-
value$B"B B B B B B B B B B B B B 
Ð
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesdense/bias/Read/ReadVariableOp dense/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_4/bias/Read/ReadVariableOp"dense_4/kernel/Read/ReadVariableOp dense_5/bias/Read/ReadVariableOp"dense_5/kernel/Read/ReadVariableOpglobal_step/Read/ReadVariableOp"/device:CPU:0*
dtypes
2	
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
 
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
N*
T0*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
±
save/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*Ò
valueÈBÅB
dense/biasBdense/kernelBdense_1/biasBdense_1/kernelBdense_2/biasBdense_2/kernelBdense_3/biasBdense_3/kernelBdense_4/biasBdense_4/kernelBdense_5/biasBdense_5/kernelBglobal_step

save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*-
value$B"B B B B B B B B B B B B B 
Û
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*H
_output_shapes6
4:::::::::::::*
dtypes
2	
N
save/Identity_1Identitysave/RestoreV2*
T0*
_output_shapes
:
S
save/AssignVariableOpAssignVariableOp
dense/biassave/Identity_1*
dtype0
P
save/Identity_2Identitysave/RestoreV2:1*
T0*
_output_shapes
:
W
save/AssignVariableOp_1AssignVariableOpdense/kernelsave/Identity_2*
dtype0
P
save/Identity_3Identitysave/RestoreV2:2*
T0*
_output_shapes
:
W
save/AssignVariableOp_2AssignVariableOpdense_1/biassave/Identity_3*
dtype0
P
save/Identity_4Identitysave/RestoreV2:3*
T0*
_output_shapes
:
Y
save/AssignVariableOp_3AssignVariableOpdense_1/kernelsave/Identity_4*
dtype0
P
save/Identity_5Identitysave/RestoreV2:4*
T0*
_output_shapes
:
W
save/AssignVariableOp_4AssignVariableOpdense_2/biassave/Identity_5*
dtype0
P
save/Identity_6Identitysave/RestoreV2:5*
T0*
_output_shapes
:
Y
save/AssignVariableOp_5AssignVariableOpdense_2/kernelsave/Identity_6*
dtype0
P
save/Identity_7Identitysave/RestoreV2:6*
T0*
_output_shapes
:
W
save/AssignVariableOp_6AssignVariableOpdense_3/biassave/Identity_7*
dtype0
P
save/Identity_8Identitysave/RestoreV2:7*
T0*
_output_shapes
:
Y
save/AssignVariableOp_7AssignVariableOpdense_3/kernelsave/Identity_8*
dtype0
P
save/Identity_9Identitysave/RestoreV2:8*
T0*
_output_shapes
:
W
save/AssignVariableOp_8AssignVariableOpdense_4/biassave/Identity_9*
dtype0
Q
save/Identity_10Identitysave/RestoreV2:9*
T0*
_output_shapes
:
Z
save/AssignVariableOp_9AssignVariableOpdense_4/kernelsave/Identity_10*
dtype0
R
save/Identity_11Identitysave/RestoreV2:10*
T0*
_output_shapes
:
Y
save/AssignVariableOp_10AssignVariableOpdense_5/biassave/Identity_11*
dtype0
R
save/Identity_12Identitysave/RestoreV2:11*
T0*
_output_shapes
:
[
save/AssignVariableOp_11AssignVariableOpdense_5/kernelsave/Identity_12*
dtype0
R
save/Identity_13Identitysave/RestoreV2:12*
T0	*
_output_shapes
:
X
save/AssignVariableOp_12AssignVariableOpglobal_stepsave/Identity_13*
dtype0	
í
save/restore_shardNoOp^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_10^save/AssignVariableOp_11^save/AssignVariableOp_12^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/AssignVariableOp_6^save/AssignVariableOp_7^save/AssignVariableOp_8^save/AssignVariableOp_9
-
save/restore_allNoOp^save/restore_shard

ü
dropout_2_cond_true_95756
dropout_mul_dense_2_relu
dropout_mul_1
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4
optionalfromvalue_5
optionalfromvalue_6c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *ä8?2
dropout/Const
dropout/MulMuldropout_mul_dense_2_reludropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Mulf
dropout/ShapeShapedropout_mul_dense_2_relu*
T0*
_output_shapes
:2
dropout/Shapeµ
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌÌ=2
dropout/GreaterEqual/y¿
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Mul_1
OptionalFromValueOptionalFromValuedropout/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue
OptionalFromValue_1OptionalFromValuedropout/Mul:z:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_1
OptionalFromValue_2OptionalFromValuedropout/Shape:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2
OptionalFromValue_3OptionalFromValue-dropout/random_uniform/RandomUniform:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3
OptionalFromValue_4OptionalFromValuedropout/GreaterEqual/y:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4
OptionalFromValue_5OptionalFromValuedropout/GreaterEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_5
OptionalFromValue_6OptionalFromValuedropout/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_6""
dropout_mul_1dropout/Mul_1:z:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0"5
optionalfromvalue_5OptionalFromValue_5:optional:0"5
optionalfromvalue_6OptionalFromValue_6:optional:0*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:. *
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

ø
dropout_cond_true_95628
dropout_mul_dense_relu
dropout_mul_1
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4
optionalfromvalue_5
optionalfromvalue_6c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *ä8?2
dropout/Const
dropout/MulMuldropout_mul_dense_reludropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Muld
dropout/ShapeShapedropout_mul_dense_relu*
T0*
_output_shapes
:2
dropout/Shapeµ
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌÌ=2
dropout/GreaterEqual/y¿
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Mul_1
OptionalFromValueOptionalFromValuedropout/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue
OptionalFromValue_1OptionalFromValuedropout/Mul:z:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_1
OptionalFromValue_2OptionalFromValuedropout/Shape:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2
OptionalFromValue_3OptionalFromValue-dropout/random_uniform/RandomUniform:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3
OptionalFromValue_4OptionalFromValuedropout/GreaterEqual/y:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4
OptionalFromValue_5OptionalFromValuedropout/GreaterEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_5
OptionalFromValue_6OptionalFromValuedropout/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_6""
dropout_mul_1dropout/Mul_1:z:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0"5
optionalfromvalue_5OptionalFromValue_5:optional:0"5
optionalfromvalue_6OptionalFromValue_6:optional:0*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:. *
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

ü
dropout_3_cond_true_95820
dropout_mul_dense_3_relu
dropout_mul_1
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4
optionalfromvalue_5
optionalfromvalue_6c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *ä8?2
dropout/Const
dropout/MulMuldropout_mul_dense_3_reludropout/Const:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dropout/Mulf
dropout/ShapeShapedropout_mul_dense_3_relu*
T0*
_output_shapes
:2
dropout/Shape´
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌÌ=2
dropout/GreaterEqual/y¾
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dropout/Castz
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2
dropout/Mul_1
OptionalFromValueOptionalFromValuedropout/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue
OptionalFromValue_1OptionalFromValuedropout/Mul:z:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_1
OptionalFromValue_2OptionalFromValuedropout/Shape:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2
OptionalFromValue_3OptionalFromValue-dropout/random_uniform/RandomUniform:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3
OptionalFromValue_4OptionalFromValuedropout/GreaterEqual/y:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4
OptionalFromValue_5OptionalFromValuedropout/GreaterEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_5
OptionalFromValue_6OptionalFromValuedropout/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_6""
dropout_mul_1dropout/Mul_1:z:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0"5
optionalfromvalue_5OptionalFromValue_5:optional:0"5
optionalfromvalue_6OptionalFromValue_6:optional:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:- )
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
é	
Ë
dropout_cond_false_95629
identity_dense_relu
identity
optionalnone
optionalnone_1
optionalnone_2
optionalnone_3
optionalnone_4
optionalnone_5
optionalnone_6h
IdentityIdentityidentity_dense_relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

IdentityD
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNoneH
OptionalNone_1OptionalNone*
_output_shapes
: 2
OptionalNone_1H
OptionalNone_2OptionalNone*
_output_shapes
: 2
OptionalNone_2H
OptionalNone_3OptionalNone*
_output_shapes
: 2
OptionalNone_3H
OptionalNone_4OptionalNone*
_output_shapes
: 2
OptionalNone_4H
OptionalNone_5OptionalNone*
_output_shapes
: 2
OptionalNone_5H
OptionalNone_6OptionalNone*
_output_shapes
: 2
OptionalNone_6"
identityIdentity:output:0"'
optionalnoneOptionalNone:optional:0"+
optionalnone_1OptionalNone_1:optional:0"+
optionalnone_2OptionalNone_2:optional:0"+
optionalnone_3OptionalNone_3:optional:0"+
optionalnone_4OptionalNone_4:optional:0"+
optionalnone_5OptionalNone_5:optional:0"+
optionalnone_6OptionalNone_6:optional:0*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:. *
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ

ü
dropout_1_cond_true_95692
dropout_mul_dense_1_relu
dropout_mul_1
optionalfromvalue
optionalfromvalue_1
optionalfromvalue_2
optionalfromvalue_3
optionalfromvalue_4
optionalfromvalue_5
optionalfromvalue_6c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *ä8?2
dropout/Const
dropout/MulMuldropout_mul_dense_1_reludropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Mulf
dropout/ShapeShapedropout_mul_dense_1_relu*
T0*
_output_shapes
:2
dropout/Shapeµ
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *ÍÌÌ=2
dropout/GreaterEqual/y¿
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/GreaterEqual
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2
dropout/Mul_1
OptionalFromValueOptionalFromValuedropout/Const:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue
OptionalFromValue_1OptionalFromValuedropout/Mul:z:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_1
OptionalFromValue_2OptionalFromValuedropout/Shape:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_2
OptionalFromValue_3OptionalFromValue-dropout/random_uniform/RandomUniform:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_3
OptionalFromValue_4OptionalFromValuedropout/GreaterEqual/y:output:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_4
OptionalFromValue_5OptionalFromValuedropout/GreaterEqual:z:0*
Toutput_types
2
*
_output_shapes
: 2
OptionalFromValue_5
OptionalFromValue_6OptionalFromValuedropout/Cast:y:0*
Toutput_types
2*
_output_shapes
: 2
OptionalFromValue_6""
dropout_mul_1dropout/Mul_1:z:0"1
optionalfromvalueOptionalFromValue:optional:0"5
optionalfromvalue_1OptionalFromValue_1:optional:0"5
optionalfromvalue_2OptionalFromValue_2:optional:0"5
optionalfromvalue_3OptionalFromValue_3:optional:0"5
optionalfromvalue_4OptionalFromValue_4:optional:0"5
optionalfromvalue_5OptionalFromValue_5:optional:0"5
optionalfromvalue_6OptionalFromValue_6:optional:0*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:. *
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ì	
Ï
dropout_3_cond_false_95821
identity_dense_3_relu
identity
optionalnone
optionalnone_1
optionalnone_2
optionalnone_3
optionalnone_4
optionalnone_5
optionalnone_6i
IdentityIdentityidentity_dense_3_relu*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@2

IdentityD
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNoneH
OptionalNone_1OptionalNone*
_output_shapes
: 2
OptionalNone_1H
OptionalNone_2OptionalNone*
_output_shapes
: 2
OptionalNone_2H
OptionalNone_3OptionalNone*
_output_shapes
: 2
OptionalNone_3H
OptionalNone_4OptionalNone*
_output_shapes
: 2
OptionalNone_4H
OptionalNone_5OptionalNone*
_output_shapes
: 2
OptionalNone_5H
OptionalNone_6OptionalNone*
_output_shapes
: 2
OptionalNone_6"
identityIdentity:output:0"'
optionalnoneOptionalNone:optional:0"+
optionalnone_1OptionalNone_1:optional:0"+
optionalnone_2OptionalNone_2:optional:0"+
optionalnone_3OptionalNone_3:optional:0"+
optionalnone_4OptionalNone_4:optional:0"+
optionalnone_5OptionalNone_5:optional:0"+
optionalnone_6OptionalNone_6:optional:0*&
_input_shapes
:ÿÿÿÿÿÿÿÿÿ@:- )
'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ@
ï	
Ï
dropout_2_cond_false_95757
identity_dense_2_relu
identity
optionalnone
optionalnone_1
optionalnone_2
optionalnone_3
optionalnone_4
optionalnone_5
optionalnone_6j
IdentityIdentityidentity_dense_2_relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

IdentityD
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNoneH
OptionalNone_1OptionalNone*
_output_shapes
: 2
OptionalNone_1H
OptionalNone_2OptionalNone*
_output_shapes
: 2
OptionalNone_2H
OptionalNone_3OptionalNone*
_output_shapes
: 2
OptionalNone_3H
OptionalNone_4OptionalNone*
_output_shapes
: 2
OptionalNone_4H
OptionalNone_5OptionalNone*
_output_shapes
: 2
OptionalNone_5H
OptionalNone_6OptionalNone*
_output_shapes
: 2
OptionalNone_6"
identityIdentity:output:0"'
optionalnoneOptionalNone:optional:0"+
optionalnone_1OptionalNone_1:optional:0"+
optionalnone_2OptionalNone_2:optional:0"+
optionalnone_3OptionalNone_3:optional:0"+
optionalnone_4OptionalNone_4:optional:0"+
optionalnone_5OptionalNone_5:optional:0"+
optionalnone_6OptionalNone_6:optional:0*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:. *
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
ï	
Ï
dropout_1_cond_false_95693
identity_dense_1_relu
identity
optionalnone
optionalnone_1
optionalnone_2
optionalnone_3
optionalnone_4
optionalnone_5
optionalnone_6j
IdentityIdentityidentity_dense_1_relu*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ2

IdentityD
OptionalNoneOptionalNone*
_output_shapes
: 2
OptionalNoneH
OptionalNone_1OptionalNone*
_output_shapes
: 2
OptionalNone_1H
OptionalNone_2OptionalNone*
_output_shapes
: 2
OptionalNone_2H
OptionalNone_3OptionalNone*
_output_shapes
: 2
OptionalNone_3H
OptionalNone_4OptionalNone*
_output_shapes
: 2
OptionalNone_4H
OptionalNone_5OptionalNone*
_output_shapes
: 2
OptionalNone_5H
OptionalNone_6OptionalNone*
_output_shapes
: 2
OptionalNone_6"
identityIdentity:output:0"'
optionalnoneOptionalNone:optional:0"+
optionalnone_1OptionalNone_1:optional:0"+
optionalnone_2OptionalNone_2:optional:0"+
optionalnone_3OptionalNone_3:optional:0"+
optionalnone_4OptionalNone_4:optional:0"+
optionalnone_5OptionalNone_5:optional:0"+
optionalnone_6OptionalNone_6:optional:0*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:. *
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"¸<
save/Const:0save/Identity:0save/restore_all (5 @F8"~
global_stepom
k
global_step:0global_step/Assign!global_step/Read/ReadVariableOp:0(2global_step/Initializer/zeros:0H"%
saved_model_main_op


group_deps"Â
trainable_variablesª§
x
dense/kernel:0dense/kernel/Assign"dense/kernel/Read/ReadVariableOp:0(2)dense/kernel/Initializer/random_uniform:08
g
dense/bias:0dense/bias/Assign dense/bias/Read/ReadVariableOp:0(2dense/bias/Initializer/zeros:08

dense_1/kernel:0dense_1/kernel/Assign$dense_1/kernel/Read/ReadVariableOp:0(2+dense_1/kernel/Initializer/random_uniform:08
o
dense_1/bias:0dense_1/bias/Assign"dense_1/bias/Read/ReadVariableOp:0(2 dense_1/bias/Initializer/zeros:08

dense_2/kernel:0dense_2/kernel/Assign$dense_2/kernel/Read/ReadVariableOp:0(2+dense_2/kernel/Initializer/random_uniform:08
o
dense_2/bias:0dense_2/bias/Assign"dense_2/bias/Read/ReadVariableOp:0(2 dense_2/bias/Initializer/zeros:08

dense_3/kernel:0dense_3/kernel/Assign$dense_3/kernel/Read/ReadVariableOp:0(2+dense_3/kernel/Initializer/random_uniform:08
o
dense_3/bias:0dense_3/bias/Assign"dense_3/bias/Read/ReadVariableOp:0(2 dense_3/bias/Initializer/zeros:08

dense_4/kernel:0dense_4/kernel/Assign$dense_4/kernel/Read/ReadVariableOp:0(2+dense_4/kernel/Initializer/random_uniform:08
o
dense_4/bias:0dense_4/bias/Assign"dense_4/bias/Read/ReadVariableOp:0(2 dense_4/bias/Initializer/zeros:08

dense_5/kernel:0dense_5/kernel/Assign$dense_5/kernel/Read/ReadVariableOp:0(2+dense_5/kernel/Initializer/random_uniform:08
o
dense_5/bias:0dense_5/bias/Assign"dense_5/bias/Read/ReadVariableOp:0(2 dense_5/bias/Initializer/zeros:08"¥
	variables
k
global_step:0global_step/Assign!global_step/Read/ReadVariableOp:0(2global_step/Initializer/zeros:0H
x
dense/kernel:0dense/kernel/Assign"dense/kernel/Read/ReadVariableOp:0(2)dense/kernel/Initializer/random_uniform:08
g
dense/bias:0dense/bias/Assign dense/bias/Read/ReadVariableOp:0(2dense/bias/Initializer/zeros:08

dense_1/kernel:0dense_1/kernel/Assign$dense_1/kernel/Read/ReadVariableOp:0(2+dense_1/kernel/Initializer/random_uniform:08
o
dense_1/bias:0dense_1/bias/Assign"dense_1/bias/Read/ReadVariableOp:0(2 dense_1/bias/Initializer/zeros:08

dense_2/kernel:0dense_2/kernel/Assign$dense_2/kernel/Read/ReadVariableOp:0(2+dense_2/kernel/Initializer/random_uniform:08
o
dense_2/bias:0dense_2/bias/Assign"dense_2/bias/Read/ReadVariableOp:0(2 dense_2/bias/Initializer/zeros:08

dense_3/kernel:0dense_3/kernel/Assign$dense_3/kernel/Read/ReadVariableOp:0(2+dense_3/kernel/Initializer/random_uniform:08
o
dense_3/bias:0dense_3/bias/Assign"dense_3/bias/Read/ReadVariableOp:0(2 dense_3/bias/Initializer/zeros:08

dense_4/kernel:0dense_4/kernel/Assign$dense_4/kernel/Read/ReadVariableOp:0(2+dense_4/kernel/Initializer/random_uniform:08
o
dense_4/bias:0dense_4/bias/Assign"dense_4/bias/Read/ReadVariableOp:0(2 dense_4/bias/Initializer/zeros:08

dense_5/kernel:0dense_5/kernel/Assign$dense_5/kernel/Read/ReadVariableOp:0(2+dense_5/kernel/Initializer/random_uniform:08
o
dense_5/bias:0dense_5/bias/Assign"dense_5/bias/Read/ReadVariableOp:0(2 dense_5/bias/Initializer/zeros:08*
serving_defaultv
.
input%
input_tensor:0ÿÿÿÿÿÿÿÿÿ(
boxtype

GatherV2:0ÿÿÿÿÿÿÿÿÿtensorflow/serving/predict