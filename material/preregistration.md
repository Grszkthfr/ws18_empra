# [As Predicted](aspredicted.org): "Gaze cueing with context in a modified Posner cueing task (winter 2018)" (#17145)

Created: 11/28/2018 04:17 AM (PT), not yet public

Author(s)
Jonas Großekathöfer (University of Wuerzburg) - jonas.grossekathoefer@uni-wuerzburg.de

Matthias Gamer (University of Würzburg) - matthias.gamer@uni-wuerzburg.de

## 1) Have any data been collected for this study already?

No, no data have been collected for this study yet.

## 2) What's the main question being asked or hypothesis being tested in this study?

The main question of interest is, whether context information is of relevance for gaze following. In an experimental setting, a modified gaze cueing paradigm (Kingstone & Friesen, 1998) is used to investigate the influence of context on the gaze cueing effect.
In fact, we expect a stronger gaze cueing effect for faces with present context compared to faces with coverd context.

## 3) Describe the key dependent variable(s) specifying how they will be measured.

The dependent variables are reaction times. By pressing a key, participants identify a target (E or F) shown at one of two possible target locations.

## 4) How many and which conditions will participants be assigned to?

We use a within subject design with the factors congruency (congruent:incongruent) and context (present:covered).
Congruency indicates in a given trial the relationship between the stimulus and the target.
In congruent trials the gaze is directed at the target.
In incongruent trials the gaze is not directed at the target, in fact the gaze points to the other possible target location.
In trials with context present the whole scene of a naturalistic photography, with two possible areas for target appearance, is visible.
In trials with context coverd only the face of the stimulus is visible, also with two possible areas for target appearance.

## 5) Specify exactly which analyses you will conduct to examine the main question/hypothesis.

We fit a linear mixed effects model to the data using the R-package "lme4" (Bates, Bolker, Walker, 2014).
As fixed effects congruency and context with all main effects and interaction (congruency*context) is of interest.
For the maximum model (Barr et al., 2013), the following random effects paramters are included to capture the certain dependencies among data points: stimulus, experimenter, session and subject.
Specifically, as a random slope (congruency*context|stimulus) is added, to take differences in the effects accros stimuli into account.
Aditionally, we want to control for variance in subjects. As subjects are nested in sessions (as some participants are tested together), which are conducted (and nested in) by different experimenter, we take that structure into account as well by adding (congruency*context|experimenter/session/subject) to the formula.
Formula:
RT ~ congruency * context + (congruency*context|stimulus) + (congruency*context|experimenter/session/subject)

In case, the model does not converge successfully we first start to remove correlations among random slopes, replace random slopes with intercepts, or in the final case, remove random effect parameters (as discussed in Singmann & Kellen, in press).
Singificance tests for the confirmatory analysis will be run with the R-package "lmerTest" (Kuznetsova, Brockhoff, and Christensen, 2017).

## 6) Describe exactly how outliers will be defined and handled, and your precise rule(s) for excluding observations.

Anticipatory (< 150ms) and slow (> 800ms) reaction times will be excluded from the analysis. A complete subject will be removed from the analysis, when error rate is exceptionally high (> 30%), indicating a lack of motivation or a misunderstanding of task instructions.

## 7) How many observations will be collected or what will determine sample size?

No need to justify decision, but be precise about exactly how the number will be determined.
A power simulation led us to the conclusion that a sample size of n=75 is required to receive an acceptable power of .75.

## 8) Anything else you would like to pre-register?

(e.g., secondary analyses, variables collected for exploratory purposes, unusual analyses planned?)
no