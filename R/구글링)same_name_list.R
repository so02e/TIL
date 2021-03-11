lst1 <- list(list(c(1,2,3)),list(c(7,8,9)),list(c(4,5,6)),list(c(10,11,12)))
names(lst1) <- c("a","b","a","b")


nm <- names(lst1) # a
result <- lapply(unique(nm), function(n) unname(unlist(lst1[nm %in% n])))
names(result) <- unique(nm)
result


vec <- unlist(lst1)
split(unname(vec), sub("\\d+$", "", names(vec)))

tapply(lst1,names(lst1),FUN=function(x) unname(unlist(x)))
