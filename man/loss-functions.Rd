% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/losses.R
\name{loss-functions}
\alias{loss-functions}
\alias{loss_binary_crossentropy}
\alias{"binary_crossentropy",}
\alias{"BinaryCrossentropy"}
\alias{loss_categorical_crossentropy}
\alias{loss_categorical_hinge}
\alias{loss_cosine_similarity}
\alias{loss_hinge}
\alias{loss_huber}
\alias{loss_kullback_leibler_divergence}
\alias{loss_kl_divergence}
\alias{loss_logcosh}
\alias{loss_mean_absolute_error}
\alias{loss_mean_absolute_percentage_error}
\alias{loss_mean_squared_error}
\alias{loss_mean_squared_logarithmic_error}
\alias{loss_poisson}
\alias{loss_sparse_categorical_crossentropy}
\alias{loss_squared_hinge}
\title{Loss functions}
\usage{
loss_binary_crossentropy(
  y_true,
  y_pred,
  from_logits = FALSE,
  label_smoothing = 0,
  axis = -1L,
  ...,
  reduction = "auto",
  name = "binary_crossentropy"
)

loss_categorical_crossentropy(
  y_true,
  y_pred,
  from_logits = FALSE,
  label_smoothing = 0L,
  axis = -1L,
  ...,
  reduction = "auto",
  name = "categorical_crossentropy"
)

loss_categorical_hinge(
  y_true,
  y_pred,
  ...,
  reduction = "auto",
  name = "categorical_hinge"
)

loss_cosine_similarity(
  y_true,
  y_pred,
  axis = -1L,
  ...,
  reduction = "auto",
  name = "cosine_similarity"
)

loss_hinge(y_true, y_pred, ..., reduction = "auto", name = "hinge")

loss_huber(
  y_true,
  y_pred,
  delta = 1,
  ...,
  reduction = "auto",
  name = "huber_loss"
)

loss_kullback_leibler_divergence(
  y_true,
  y_pred,
  ...,
  reduction = "auto",
  name = "kl_divergence"
)

loss_kl_divergence(
  y_true,
  y_pred,
  ...,
  reduction = "auto",
  name = "kl_divergence"
)

loss_logcosh(y_true, y_pred, ..., reduction = "auto", name = "log_cosh")

loss_mean_absolute_error(
  y_true,
  y_pred,
  ...,
  reduction = "auto",
  name = "mean_absolute_error"
)

loss_mean_absolute_percentage_error(
  y_true,
  y_pred,
  ...,
  reduction = "auto",
  name = "mean_absolute_percentage_error"
)

loss_mean_squared_error(
  y_true,
  y_pred,
  ...,
  reduction = "auto",
  name = "mean_squared_error"
)

loss_mean_squared_logarithmic_error(
  y_true,
  y_pred,
  ...,
  reduction = "auto",
  name = "mean_squared_logarithmic_error"
)

loss_poisson(y_true, y_pred, ..., reduction = "auto", name = "poisson")

loss_sparse_categorical_crossentropy(
  y_true,
  y_pred,
  from_logits = FALSE,
  axis = -1L,
  ...,
  reduction = "auto",
  name = "sparse_categorical_crossentropy"
)

loss_squared_hinge(
  y_true,
  y_pred,
  ...,
  reduction = "auto",
  name = "squared_hinge"
)
}
\arguments{
\item{y_true}{Ground truth values. shape = \verb{[batch_size, d1, .. dN]}.}

\item{y_pred}{The predicted values. shape = \verb{[batch_size, d1, .. dN]}.
(Tensor of the same shape as \code{y_true})}

\item{from_logits}{Whether \code{y_pred} is expected to be a logits tensor. By
default we assume that \code{y_pred} encodes a probability distribution.}

\item{label_smoothing}{Float in \verb{[0, 1]}. If \verb{> 0} then smooth the labels.
For example, if \code{0.1}, use \code{0.1 / num_classes} for non-target labels and
\code{0.9 + 0.1 / num_classes} for target labels.}

\item{axis}{The axis along which to compute crossentropy (the features axis).
Axis is 1-based (e.g, first axis is \code{axis=1}). Defaults to \code{-1} (the last axis).}

\item{...}{Additional arguments passed on to the Python callable (for forward
and backwards compatibility).}

\item{reduction}{Only applicable if \code{y_true} and \code{y_pred} are missing. Type
of \code{keras$losses$Reduction} to apply to loss. Default value is \code{AUTO}.
\code{AUTO} indicates that the reduction option will be determined by the usage
context. For almost all cases this defaults to \code{SUM_OVER_BATCH_SIZE}. When
used with \code{tf$distribute$Strategy}, outside of built-in training loops such
as \code{compile} and \code{fit}, using \code{AUTO} or \code{SUM_OVER_BATCH_SIZE} will raise an
error. Please see this custom training \href{https://www.tensorflow.org/tutorials/distribute/custom_training}{tutorial} for more
details.}

\item{name}{Only applicable if \code{y_true} and \code{y_pred} are missing. Optional
name for the Loss instance.}

\item{delta}{A float, the point where the Huber loss function changes from a
quadratic to linear.}
}
\value{
If called with \code{y_true} and \code{y_pred}, then the corresponding loss is
evaluated and the result returned (as a tensor). Alternatively, if \code{y_true}
and \code{y_pred} are missing, then a callable is returned that will compute the
loss function and, by default, reduce the loss to a scalar tensor; see the
\code{reduction} parameter for details. (The callable is a typically a class
instance that inherits from \code{keras$losses$Loss}).
}
\description{
Loss functions
}
\details{
Loss functions for model training. These are typically supplied in
the \code{loss} parameter of the \code{\link[=compile.keras.engine.training.Model]{compile.keras.engine.training.Model()}}
function.
}
\section{binary_crossentropy}{


Computes the binary crossentropy loss.

\code{label_smoothing} details: Float in \verb{[0, 1]}. If \verb{> 0} then smooth the labels
by squeezing them towards 0.5 That is, using \code{1. - 0.5 * label_smoothing}
for the target class and \code{0.5 * label_smoothing} for the non-target class.
}

\section{categorical_crossentropy}{


Computes the categorical crossentropy loss.

When using the categorical_crossentropy loss, your targets should be in
categorical format (e.g. if you have 10 classes, the target for each sample
should be a 10-dimensional vector that is all-zeros except for a 1 at the
index corresponding to the class of the sample). In order to convert
integer targets into categorical targets, you can use the Keras utility
function \code{\link[=to_categorical]{to_categorical()}}:

\code{categorical_labels <- to_categorical(int_labels, num_classes = NULL)}
}

\section{huber}{


Computes Huber loss value.
For each value x in \code{error = y_true - y_pred}:\preformatted{loss = 0.5 * x^2                  if |x| <= d
loss = d * |x| - 0.5 * d^2        if |x| > d
}

where d is \code{delta}. See: https://en.wikipedia.org/wiki/Huber_loss
}

\section{log_cosh}{


Logarithm of the hyperbolic cosine of the prediction error.

\code{log(cosh(x))} is approximately equal to \code{(x ** 2) / 2} for small \code{x} and
to \code{abs(x) - log(2)} for large \code{x}. This means that 'logcosh' works mostly
like the mean squared error, but will not be so strongly affected by the
occasional wildly incorrect prediction. However, it may return NaNs if the
intermediate value \code{cosh(y_pred - y_true)} is too large to be represented
in the chosen precision.
}

\seealso{
\code{\link[=compile.keras.engine.training.Model]{compile.keras.engine.training.Model()}},
\code{\link[=loss_binary_crossentropy]{loss_binary_crossentropy()}}
}
