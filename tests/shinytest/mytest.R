app <- ShinyDriver$new("../../")
app$snapshotInit("mytest")

app$setInputs(variables = "famsize")
app$setInputs(variables = c("famsize", "Fedu"))
app$setInputs(variables = c("famsize", "Fedu", "Mjob"))
app$snapshot()
