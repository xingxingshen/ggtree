


##' @importFrom ggplot2 last_plot
get_tree_view <- function(tree_view) {
    if (is.null(tree_view))
        tree_view <- last_plot()

    return(tree_view)
}

reverse.treeview <- function(tv) {
    tv$data <- reverse.treeview.data(tv$data)
    return(tv)
}

reverse.treeview.data <- function(df) {
    root <- df$node[df$node == df$parent]
    df$x <- getXcoord2(df$x, root, df$parent, df$node,
                       df$length, start=max(df$x), rev=TRUE)
    return(df)
}


color_scale <- function(c1="grey", c2="red", n=100) {
    pal <- colorRampPalette(c(c1, c2))
    colors <- pal(n)
    return(colors)
}

getIdx <- function(v, MIN, MAX, interval=NULL) {
    res <- sapply(v, getIdx_internal, MIN=MIN, MAX=MAX, interval=interval)
    attr(res, "interval") <- interval
    return(res)
}

getIdx_internal <- function(v, MIN, MAX, interval=NULL) {
    if (is.na(v)) {
        return(NA)
    }
    if ( MIN == MAX ) {
        return(100)
    }
    res <- max(which(interval <= v))
    return(res)
}


get_color_attribute <- function(p) {
    p$data[, "color"]
}

is.tree_attribute <- function(df, var) {
    if(length(var) == 1 &&
       !is.null(var)    &&
       var %in% colnames(df)) {
        return(TRUE)
    }
    return(FALSE)
}

is.tree_attribute_ <- function(p, var) {
    is.tree_attribute(p$data, var)
}



roundDigit <- function(d) {
    i <- 0
    while(d < 1) {
        d <- d * 10
        i <- i + 1
    }
    round(d)/10^i
}


## . function was from plyr package
##' capture name of variable
##'
##' @rdname dotFun
##' @export
##' @title .
##' @param ... expression
##' @param .env environment
##' @return expression
##' @examples
##' x <- 1
##' eval(.(x)[[1]])
. <- function (..., .env = parent.frame()) {
    structure(as.list(match.call()[-1]), env = .env, class = "quoted")
}


## from ChIPseeker
##' @importFrom grDevices colorRampPalette
getCols <- function (n) {
    col <- c("#8dd3c7", "#ffffb3", "#bebada", "#fb8072", "#80b1d3",
             "#fdb462", "#b3de69", "#fccde5", "#d9d9d9", "#bc80bd",
             "#ccebc5", "#ffed6f")
    col2 <- c("#1f78b4", "#ffff33", "#c2a5cf", "#ff7f00", "#810f7c",
              "#a6cee3", "#006d2c", "#4d4d4d", "#8c510a", "#d73027",
              "#78c679", "#7f0000", "#41b6c4", "#e7298a", "#54278f")
    col3 <- c("#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99",
              "#e31a1c", "#fdbf6f", "#ff7f00", "#cab2d6", "#6a3d9a",
              "#ffff99", "#b15928")
    colorRampPalette(col3)(n)
}

##' @importFrom rvcheck get_fun_from_pkg
hist <- get_fun_from_pkg("graphics", "hist")






