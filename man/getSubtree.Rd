% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidytree.R
\name{getSubtree}
\alias{getSubtree}
\title{getSubtree}
\usage{
getSubtree(tree, node)
}
\arguments{
\item{tree}{ape phylo tree object}

\item{node}{is the tree node id from which the tree is derived.}
}
\value{
list of all child node id's from starting node.
}
\description{
Get all children of node from tree, including start_node.
}
