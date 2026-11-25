# CRAN submission comments

## Summary of changes since version 2.13

* Added 15 new functions that launch Shiny apps for interactive
  classroom demonstrations (ShinyCorExamp, ShinyCorExamp2,
  ShinyHistogramBuild, ShinyStemBuild, ShinyBoxplotBuild,
  ShinyHistogramExamp, ShinyPutPoints, ShinyNormal,
  ShinySamplingDistProp, ShinySamplingDistMean, ShinyCLTExamp,
  ShinyConfIntExamp, ShinyPowerExamp, ShinyPvalueNormSim,
  ShinyPvalueBinomSim). Several of these wrap existing package
  functions (e.g. clt.examp, ci.examp, power.examp,
  Pvalue.norm.sim, Pvalue.binom.sim) in a Shiny UI; `shiny` is
  listed in Suggests and all calls to it are guarded by
  `requireNamespace()` and namespaced with `shiny::`.

* These Shiny demo functions launch their apps with
  `shiny::startApp()` instead of `shiny::runApp()`, so they run
  in the background without blocking the R console. Each
  function returns a `ShinyAppHandle` that can be stopped with
  `handle$stop()`.

* Updated `plot.rgl.coin`, `rgl.die`, `flip.rgl.coin`,
  `roll.rgl.die`, and `rgl.Map` to use current (non-deprecated)
  `rgl` functions (e.g. `view3d`, `quads3d`, `triangles3d`) in
  place of the deprecated `rgl.viewpoint`, `rgl.quads`,
  `rgl.triangles`, etc.

* `DESCRIPTION` now uses `Authors@R` in place of the separate
  `Author`/`Maintainer` fields.

* Fixed a moved URL in `faces.Rd` (now points to the `https`
  address).

See NEWS for full details.

## Test environments

* local Windows 11 x64, R 4.6.2
* `R CMD check --as-cran` on the built source tarball

## R CMD check results

0 errors | 0 warnings | 0 notes (on CRAN's reference check
environment)

On this local machine, `R CMD check --as-cran` additionally
reports:

* WARNING: "LaTeX errors when creating PDF version [of the
  manual]" / ERROR: "checking PDF version of manual without
  index". This is caused by an incomplete local TinyTeX font
  configuration (`\textfont 0 is undefined` when rendering a
  `\url{}` entry), not by any change in this release: the same
  failure reproduces when building and checking the unmodified,
  currently-published 2.13 source tarball on this machine. We
  expect this check to pass on CRAN's build machines, which have
  a complete TeX Live installation.

## Downstream dependencies

We ran `revdepcheck::revdep_check()`, comparing R CMD check
results for the current CRAN version (2.13) and this release
(2.14) across all reverse dependencies.

* 17 reverse dependencies (12 from CRAN, 5 from Bioconductor)
  were successfully checked: bexy, BioStatR, brxx, bssbinom,
  CSHShydRology, geospt, GPCMlasso, icensBKL, metafolio,
  palaeoSig, RBPcurve, TipDatingBeast, and 5 Bioconductor
  packages. **We saw 0 new problems.**
* 5 packages (HDSpatialScan, R453Plus1Toolbox, Rcmdr,
  RcmdrPlugin.UCA, RNAseq123) failed to install in our local
  check sandbox due to a `callr`-related library-isolation issue
  in the check tooling itself (revdepcheck's child-process
  installer could not see a package installed in the parent
  session). This failure occurred identically for both the old
  (2.13) and new (2.14) versions of TeachingDemos, confirming it
  is unrelated to the changes in this release.

No exported function was removed, renamed, or had its signature
changed incompatibly, so no impact on reverse dependencies is
expected.
