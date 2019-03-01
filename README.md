StatR 502
=====

File hosting site for StatR 502.

To sync files, students should just need to pull from this repository. 

### Initial set-up

You will need to have Git installed. In RStudio, if you go to Tools > Global Options > Git/SVN. There is a line for `Git Executable`, it will either have a file path to your Git executable file and you're good to go, or you need to [install git](https://git-scm.com/downloads) and then add the file path (RStudio might automatically find it it you quit and re-open RStudio).

Once RStudio knows where your Git installation is, open File > New Project > Version Control > Git. Enter `https://github.com/gregorp/statr.git` as the *Repository URL*, you can use the default directory name of `statr` or customize it.

### Subsequent data pulls

In RStudio, when this project is open, you should have a `Git` tab, just like your `Plots`, `Help`, `Packages`, etc. tabs. To update your files, simply go to the `Git` tab and click **Pull**.

Do not edit the files that are pulled (but you can copy and rename them and edit the copies). Whenever you *Pull*, Git will download any new files I have added to the repository and update existing files with any changes I have made.

---

## Table of Contents

|         | Lecture Topics                          | Lab Topics                                           |
|---------|-----------------------------------------|------------------------------------------------------|
| Week 1  | Likelihood, linear regression           | Charts with ggplot2                                  |
| Week 2  | Transformations and diagnostics         | Data manipulation with tidyr and dplyr               |
| Week 3  | Logistic regression                     | Visualizing logistic regression (and a little regex) |
| Week 4  | Other GLMs, outliers                    | Robust regression                                    |
| Week 5  | Simulation, Box-Cox, packages           | Packages and documentation                           |
| Week 6  | Smoothers: loess, splines, GAM          | Building packages                                    |
| Week 7  | Best practices in workflow and vis      | Using packages in your package                       |
| Week 8  | Multilevel models                       | Bootstrapping confidence intervals                   |
| Week 9  | Collinearity, more mixed modeling       | Ecological fallacy, mixed model predictions          |
| Week 10 | Review; mentions of other useful models | -                                                    |

