# MBatch

This is for educational and research purposes only. 

Samples from large research projects are often processed and run in multiple batches at different times. Because the samples are processed in batches rather than all at once, the data can be vulnerable to systematic noise such as batch effects (unwanted variation between batches) and trend effects (unwanted variation over time), which can lead to misleading analysis results.

The MBatch R package is designed to help assess and correct for batch effects. It first allows the user to assess and quantify the presence of any batch effects via algorithms such as Hierarchical Clustering, Principal Component Analysis, and box plots. If significant batch effects are observed in the data, the user then has the option of selecting from a variety of correction algorithms, such as Empirical Bayes (aka Combat), ANOVA and Median Polish.

Additional information can be found at http://bioinformatics.mdanderson.org/main/TCGABatchEffects:Overview

MBatch on GitHub is designed to be installed using the devtools library. Complete instructions for installing MBatch and its prerequisites on Linux (Debian 9.1) are in the MBatch_01_InstallLinux.pdf file.
