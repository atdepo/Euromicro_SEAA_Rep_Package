library(stats)
library(effsize)

#under30
#between30and60
#over60
#upload the file


not_well <- read.csv("/Users/broke31/Desktop/Euromicro2024/splitted/over60/not_well_engineered.csv", sep = ",", header = TRUE, stringsAsFactors=FALSE)
well <- read.csv("/Users/broke31/Desktop/Euromicro2024/splitted/over60/well_engineered.csv", sep = ",", header = TRUE, stringsAsFactors=FALSE)

print("Complex Container Comprehension")
#run Mann-Withney Test
wi=wilcox.test(not_well$Normalized_ComplexContainerComprehension,well$Normalized_ComplexContainerComprehension)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_ComplexContainerComprehension,well$Normalized_ComplexContainerComprehension,return.dm=TRUE)
print(res)
print("Normalized_ComplexLambdaExpression")
wi=wilcox.test(not_well$Normalized_ComplexLambdaExpression,well$Normalized_ComplexLambdaExpression)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_ComplexLambdaExpression,well$Normalized_ComplexLambdaExpression,return.dm=TRUE)
print(res)


print("Normalized_LargeClass")
wi=wilcox.test(not_well$Normalized_LargeClass,well$Normalized_LargeClass)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_LargeClass,well$Normalized_LargeClass,return.dm=TRUE)
print(res)


print("Normalized_LongBaseClassList")
wi=wilcox.test(not_well$Normalized_LongBaseClassList,well$Normalized_LongBaseClassList)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_LongBaseClassList,well$Normalized_LongBaseClassList,return.dm=TRUE)
print(res)

print("Normalized_LongMessageChain")
wi=wilcox.test(not_well$Normalized_LongMessageChain,well$Normalized_LongMessageChain)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_LongMessageChain,well$Normalized_LongMessageChain,return.dm=TRUE)
print(res)

print("Normalized_LongMethod")
wi=wilcox.test(not_well$Normalized_LongMethod,well$Normalized_LongMethod)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_LongMethod,well$Normalized_LongMethod,return.dm=TRUE)
print(res)

print("Normalized_LongParameterList")
wi=wilcox.test(not_well$Normalized_LongParameterList,well$Normalized_LongParameterList)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_LongParameterList,well$Normalized_LongParameterList,return.dm=TRUE)
print(res)

print("Normalized_LongScopeChaining")
wi=wilcox.test(not_well$Normalized_LongScopeChaining,well$Normalized_LongScopeChaining)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_LongScopeChaining,well$Normalized_LongScopeChaining,return.dm=TRUE)
print(res)

print("Normalized_LongTernaryConditionalExpression")
wi=wilcox.test(not_well$Normalized_LongTernaryConditionalExpression,well$Normalized_LongTernaryConditionalExpression)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_LongTernaryConditionalExpression,well$Normalized_LongTernaryConditionalExpression,return.dm=TRUE)
print(res)

print("Normalized_MultiplyNestedContainer")
wi=wilcox.test(not_well$Normalized_MultiplyNestedContainer,well$Normalized_MultiplyNestedContainer)
print(wi)
#run Cliff's Delta
res = cliff.delta(not_well$Normalized_MultiplyNestedContainer,well$Normalized_MultiplyNestedContainer,return.dm=TRUE)
print(res)