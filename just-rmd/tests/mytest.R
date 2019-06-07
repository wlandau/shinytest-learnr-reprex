app <- ShinyDriver$new("../index.Rmd", seed = 15221)
app$snapshotInit("mytest")

app$snapshot()
