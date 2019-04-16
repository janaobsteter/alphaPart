#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME:
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP alphaPartitionDrop(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP alphaPartitionDropGroup(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
    {"alphaPartitionDrop",      (DL_FUNC) &alphaPartitionDrop,       8},
    {"alphaPartitionDropGroup", (DL_FUNC) &alphaPartitionDropGroup, 10},
    {NULL, NULL, 0}
};

void R_init_alphaPartition(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
