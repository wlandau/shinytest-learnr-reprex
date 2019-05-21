The tutorial at `example/example.Rmd` runs fine on its own in the RStudio IDE and with `rmarkdown::run()`, but I am having trouble getting `shinytest::recordTest("example")` to work.

# On Linux

```r
> shinytest::recordTest("example")
Error in sd_startShiny(self, private, path, seed, loadTimeout, shinyOptions) : 
  Error starting application:
Running application in test mode.
Loading required package: shiny
Error in (function (appDir = getwd(), port = getOption("shiny.port"),  : 
  Can't call `runApp()` from within `runApp()`. If your application code contains `runApp()`, please remove it.
> traceback()
7: stop("Error starting application:\n", paste(err_lines, collapse = "\n"))
6: sd_startShiny(self, private, path, seed, loadTimeout, shinyOptions)
5: private$startShiny(path, seed, loadTimeout, shinyOptions)
4: sd_initialize(self, private, path, loadTimeout, checkNames, debug, 
       phantomTimeout = phantomTimeout, seed = seed, cleanLogs = cleanLogs, 
       shinyOptions = shinyOptions)
3: .subset2(public_bind_env, "initialize")(...)
2: ShinyDriver$new(app, seed = seed, loadTimeout = loadTimeout, 
       shinyOptions = shinyOptions)
1: shinytest::recordTest("example")
> sessionInfo()
R version 3.5.2 (2018-12-20)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Red Hat Enterprise Linux

Matrix products: default
BLAS: /opt/R/R-3.5.2/lib64/R/lib/libRblas.so
LAPACK: /opt/R/R-3.5.2/lib64/R/lib/libRlapack.so

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.1       rstudioapi_0.10  magrittr_1.5     showimage_1.0.0 
 [5] debugme_1.1.0    xtable_1.8-4     R6_2.4.0         rlang_0.3.4.9003
 [9] rematch_1.0.1    httr_1.4.0       webdriver_1.0.5  tools_3.5.2     
[13] packrat_0.5.0    parsedate_1.2.0  png_0.1-7        withr_2.1.2     
[17] htmltools_0.3.6  assertthat_0.2.1 digest_0.6.19    crayon_1.3.4    
[21] processx_3.3.1   shiny_1.3.2      callr_3.2.0      later_0.8.0     
[25] base64enc_0.1-3  promises_1.0.1   ps_1.3.0         curl_3.3        
[29] testthat_2.1.1   shinytest_1.3.1  mime_0.6         compiler_3.5.2  
[33] pingr_1.1.2      jsonlite_1.6     httpuv_1.5.1
```

# On Mac OS

The following problem seems to affect my installation of `shinytest` in general and is not specific to prerendered R Markdown documents.

```r
> shinytest::recordTest("example")
Error in process_get_error_connection(self, private) : 
  stderr is not a pipe.
> traceback()
12: stop("stderr is not a pipe.")
11: process_get_error_connection(self, private)
10: process_read_error_lines(self, private, n)
9: ph$read_error_lines()
8: strwrap(ph$read_error_lines())
7: stop("Cannot start phantom.js, or cannot connect to it", strwrap(ph$read_error_lines()))
6: run_phantomjs(timeout = timeout)
5: get_phantomPort(timeout = phantomTimeout)
4: sd_initialize(self, private, path, loadTimeout, checkNames, debug, 
       phantomTimeout = phantomTimeout, seed = seed, cleanLogs = cleanLogs, 
       shinyOptions = shinyOptions)
3: .subset2(public_bind_env, "initialize")(...)
2: ShinyDriver$new(app, seed = seed, loadTimeout = loadTimeout, 
       shinyOptions = shinyOptions)
1: shinytest::recordTest("example")
> sessionInfo()
R version 3.6.0 (2019-04-26)
Platform: x86_64-apple-darwin15.6.0 (64-bit)
Running under: macOS Mojave 10.14.3

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
LAPACK: /Library/Frameworks/R.framework/Versions/3.6/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

loaded via a namespace (and not attached):
 [1] Rcpp_1.0.1           rstudioapi_0.10      magrittr_1.5        
 [4] showimage_1.0.0      debugme_1.1.0        xtable_1.8-4        
 [7] R6_2.4.0             rlang_0.3.4.9003     rematch_1.0.1       
[10] httr_1.4.0           webdriver_1.0.5.9000 tools_3.6.0         
[13] packrat_0.5.0        parsedate_1.2.0      png_0.1-7           
[16] withr_2.1.2          htmltools_0.3.6      assertthat_0.2.1    
[19] digest_0.6.19        crayon_1.3.4         processx_3.3.1      
[22] shiny_1.3.2          callr_3.2.0          later_0.8.0         
[25] base64enc_0.1-3      promises_1.0.1       ps_1.3.0            
[28] curl_3.3             testthat_2.1.1.9000  shinytest_1.3.1     
[31] mime_0.6             compiler_3.6.0       pingr_1.1.2         
[34] jsonlite_1.6         httpuv_1.5.1 
```
