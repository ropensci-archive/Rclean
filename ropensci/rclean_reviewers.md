# ROpenSci Reviewer Synthesis

- [x] Address issues
- [x] Increment version
- [x] Submit pull requests to dev
- [ ] Once checks pass submit to master
- [ ] Summarize for reviewers, references issue numbers and commits


Overall Response @MKLau 
- Thanks again for reviewing.
- Below are the point by point responses.
- For unchecked, please see the comments that follow.

## Documentation

- [x] @wlandau Please include a CODE_OF_CONDUCT.md file at the top
    level in your repo. You could generate one
    [here](https://github.com/ProvTools/Rclean/community) or call
    usethis::use_code_of_conduct() . On
    [this page](https://github.com/ProvTools/Rclean/community), you
    can even generate issue and pull request templates that remind
    people of the code of conduct.

    Added CODE_OF_CONDUCT.md at the top level via
    usethis::use_code_of_conduct().

- [x] @wlandau Consider renaming CONTRIBUTE.md to the more widely-used
     CONTRIBUTING.md .

    Changed to CONTRIBUTING.md.

- [x] @wlandau Do you have a longer, real-world script to show?
    simple_script.R gets the idea across, but if you show how to
    extract simple chunks from a confusing script with 1000+ lines,
    you could make Rclean really shine.

    I agree, and I added a longer, more realistic, script to the
    example scripts, see "examples/long_script.R". I used this in the
    vignette to demonstrate the utility of retrieving the code to
    produce a specific result when it is embedded in a longer,
    somewhat complicated script. I wasn't able to simply use an
    existing script from a real project because of issues with data
    dependencies. If the reviewer has a suggestion of an example, I
    would be happy to look at including it in a future update.

- [x] @wlandau At the top of the README, please consider reorganizing
    those bullet points into two paragraphs or subheadings: one
    introducing the existing problems in scripts and reproducibility,
    and then another focusing on how Rclean solves those
    problems. Maybe also elaborate on both points as well. I do not
    think this is the place to mention the provenance model or graphs,
    but you could definitely talk more about the survey you mentioned,
    the problem of messy code in science, and the fact that Rclean
    sifts through code to extract just what you need for a given
    result.

    I have edited and re-organized the content of the README to focus
    on the purpose of the package, installation and a quick start
    guide. The README refers users to the vignette for more information.

- [x] @wlandau Would you cite that survey from the third bullet in the
    README? If you cannot find the citation, feel free to remove the
    mention entirely and choose a different way to motivate the
    problem.

    > A recent survey of over 1500 scientists reported a crisis of
    reproducibility with “selective reporting” being the most cited
    contributing factor and 80% saying code availability is playing a
    role.

    This reference has been removed from the README.

- [x] @wlandau You might consider using a README.Rmd to generate the
    README.md so it is easier to refresh the docs when you change the
    package (example
    [here](https://github.com/tidyverse/dplyr/blob/master/README.Rmd)).

    Updated to use README.Rmd.

- [x] @wlandau I strongly agree with @nevrome to add examples to the
    help files for the exported functions you choose to keep (see
    below). It is difficult for me to understand how to create
    arguments for most of your exported functions.

    Exported functions now have simple examples to illustrate usage.

- [x] @wlandau The
    [vignette](https://github.com/ProvTools/Rclean/blob/master/vignettes/Rclean.rmd)
    repeats a lot of information from the README. Let's think about
    removing the redundant sections and refocusing the vignette on a
    deeper dive in a feature set not covered in the README. Perhaps
    retrospective provenance ?  See the next comment.

    README.md now functions as a quick start guide, and more detailed
    information has been moved to the vignette and JOSS paper.

- [x] @wlandau It is not intuitively clear from the docs why we need
    retrospective provenance. In the README or vignette, please
    demonstrate a situation where prospective provenance is not enough
    and retrospective provenance gives us what we seek.

    Thank you for this question, it has really pushed the development
    of a more focused package. I have removed the retrospective
    provenance functionality from the package, as I came to realize
    that it was unnecessarily slowing Rclean and complicating
    usage. The code to use retrospective provenance has been
    integrated into
    https://github.com/end-to-end-provenance/provClean, but it is now
    not used for Rclean. However, to explain the difference,
    retrospective provenance gets the lineage of a result by
    monitoring the execution of code, while prospective provenance
    infers similar information from the code prior to
    execution. Because of this difference, retrospective provenance
    can do things that prospective provenance can't, such as observe
    and record random numbers and which paths were taken through
    control statements. I have clarified this information in the
    vignette and similar information will be added to the JOSS
    article.

- [x] @wlandau Please consider citing a paper to make it clear that
    "retrospective" and "prospective" are widely used and accepted
    terms to describe provenance. A quick search reveals a couple
    possibilities (examples
    [here](https://ieeexplore.ieee.org/document/5557202) and
    [here](https://www.researchgate.net/publication/221212739_Provenance_and_scientific_workflows_Challenges_and_opportunities))?

    See the previous comment. Thanks for the references, I have added
    provenance explanations and other references to the vignette.


- [x] @nevrome Please add some more descriptive text and example code
    for clean , codeGraph and write.code . I would like to see
    codeGraph mentioned in the README/vignette.
    
    Examples are now present for exported functions and more
    expository text has been added.

- [x] @nevrome I would love to have an **example script** (maybe
     example/simple_script.R ) as a
     [package example dataset](http://r-pkgs.had.co.nz/data.html) that
     allows to explore the functions without the need to
     provide/prepare an own script. An example script will also allow
     you to add meaningful example code for the functions.

    Two example scripts, simple_script and long_script, are now
    available as R package data files. However, as clean() requires
    a file path, they cannot be passed directly into clean().

- [x] @nevrome **Retrospective Provenance** remained a mystery for
    me. The missing piece of the puzzle is how to generate the
    relevant json file. Maybe I just missed the crucial hint? I would
    prefer to see a more extensive explanation of this feature and how
    to use it in the README/vignette.

    See my explanation and comments above. 

- [x] @nevrome In the context of the Retrospective Provenance feature
    you use the ** option interface** to access the content of the
    json file. I do not understand why this rather unusual solution is
    necessary. Why can't the rd parameter simply get the relevant
    character vector? Instead of `options(prov.json =
    readLines("example/prov_micro.json")); clean(file =
    "example/micro.R", rp = TRUE) the interface could simply be
    clean(file = "example/micro.R", rp =
    readLines("example/prov_micro.json"))` or even just the path
    clean(file = "example/micro.R", rp = "example/prov_micro.json") .
    Why did you decide against this?

    Similarly here, see previous provenance comments.

- [x] @nevrome You could add a **help page** for the whole package as
    described [here](http://r-pkgs.had.co.nz/man.html#man-packages). I
    often use this page as an entry point for the function index.

    A whole package help page has been added. 

- [x] @nevrome This might be way beyond the purpose of this review,
    but as I personally consider these kind of things when I decide
    whether I want to use a package, I would like to add that I was
    not able to access neither your **homepage** http://mklau.info/
    nor the one the Github Orga ProvTools http://provtools.org/
    [2019-09-24].
    
    Thanks for checking these links. The provtools website is now
    defunct and materials have been moved to
    github.com/mklau/rclean. However, mklau.info is still supported
    and is working for me. Let me know if you happen to try accessing
    it again and have an issue.

## JOSS Co-Submission

@wlandau: missing all sections
@nevrome: missing short summary

- [ ] The **JOSS** paper manuscript seems to be in an unfinished state
    because several sections are mentioned with a keyword but not yet
    written. The text available so far is fine.

@mklau: The initial submission of the JOSS paper was based on an
example of a submitted article present on the JOSS
instructions. However, after this package review, there will be
substantial content added to the article. I am currently working on
these updates to the text.


## Functionality

- [x] @wlandau: installation and package guidelines missing.

   @mklau: This has been added to the README.

#### API

- [x] @wlandau The clean() function tries to do three things: (1) list
    lines of execution, (2) list the names of possible results, and
    (3) get the code required to produce one of the results. I agree
    that clean() should do (3), but I think (1) and (2) are not really
    cleaning yet and should go in their own functions. Maybe
    list_lines() (which returns an integer vector) and list_results()?

    The clean function has been significantly refactored. Now that the
    retrospective provenance has been removed from the package, clean
    has been streamlined. It still returns a list of possible results,
    if no results are inputed, but the focus in now on getting the
    script and a variable or several variables to determine and return
    the minimal code. There is now an exported function get_vars to
    return a list of variables in a given script.


- [x] @wlandau Similarly, it is also worth considering an entirely new
    set of functions for retrospective provenance because they have
    different inputs and
    [your underlying code is entirely different](https://github.com/ProvTools/Rclean/blob/f6b7ffc3325638ba878d7bb00df28a630043920d/R/clean.R#L86-L182).

    Already discussed above, this feature has been removed from Rclean.

- [x] @wlandau In help(package = "Rclean") , I see several API
    functions that represent very technical steps and need esoteric
    data structures. Are there specific reasons why you exported these
    things to the user? I am not sure users will want to handle matrix
    representations of graphs or PROV-JSON-formatted provenance
    objects in memory. It seems like the easiest inputs to understand
    are R script files and JSON files. Similarly, the best outputs are
    human-readable: cleaned-up scripts and plotted code graph
    visualizations. Maybe even consider writing files directly from
    clean() .  Consistency and simplicity are extremely valuable.

    Again, the API has been substantially simplified. Specific to this
    comment, JSON is no longer required because the package no longer
    uses retrospective provenance, which stores provenance in
    PROV-JSON format.

- [x] @wlandau I am questioning the need for most of Rclean 's
    exported functions.  Not all your functions need to be exported,
    and not all of them need roxygen2 docstrings.

    Good suggestion. The API has been updated with a reduction in the
    exported functions, and significant refactoring has been done to
    the code base, particularly clean.R, which now has internal
    functions included in the clean.R file itself.

- [x] @wlandau Do we really need p.spine() and p.spine() ? If you add
    a function to get the igraph from a script, it seems like you can
    simply instruct users to call dfs() themselves.

    Per the previous comment, these functions (p.spine and get.spine)
    have been refactored and integrated into clean.R. In order to keep
    the workflow and API simple for users, manually conducting the
    depth first search is not described for the users. This could be
    done for some more advanced applications, but currently I can't
    see a purpose for exposing the user to this complexity.

- [x] @wlandau Should get.libs() , var.lineage() , and var.id() really
    be exported?  clean() needs them, but do you expect most users to
    ever invoke them manually?

    var.id() has been removed. var.lineage(), now var_lineage(), has
    been internalized. get.libs(), now get_libs(), is still a part of
    the API for users, as it allows users to quickly dig out the
    libraries used in code. 

- [x] @wlandau Do we really need a write.code() function?  readLines()
    already writes code to a file, and clipr::write_clip() writes to
    the clipboard. Optional: maybe clean() itself could have an
    argument to control where the output goes: either to the clipboard
    with write_clip() or to a file if a path is given.

    Thanks for these suggestions. write.code() has become keep(),
    which now uses the clipr package. Although it may seem like a
    small step, my sense in using Rclean is that abstracting
    writeLines(), which requires the creation of a file connection,
    and combining its functionality with clipr's write_clip(),
    substantially eases the management of cleaned code. 

- [x] @wlandau You explicitly list parse.info() , read.prov() , and
     parse.graph() as internal functions. Perhaps these should not be
     exported either.

     I agree here, however, as discussed above, this feature has been
     removed.

- [x] @wlandau The names of exported functions have different naming
     conventions:  codeGraph() (camel case) vs prov_json() (snake
     case) vs get.spine() (dot-separated). For the exported functions
     you choose to keep, please consider sticking to one of these
     conventions (I recommend snake case).  Depending on the user base
     you have right now, you may want to gracefully deprecate those
     functions as
     [described here](https://ropensci.org/technotes/2017/01/05/package-evolution/).

     Good suggestion. Switched to snake case throughout. 

#### Installation and automated checks

- [x] @wlandau Re
    https://github.com/ropensci/software-review/issues/327#issuecomment-520062929,
    I also had some trouble installing Rclean . I needed to install
    Rgraphviz directly from Bioconductor. I suggest adding the
    following to the installation instructions in the README. At the
    very least, it is a useful stopgap until @annakrystalli's pull
    request to CodeDepends reaches CRAN.
    
    ```r
    install.packages("BiocManager")
    BiocManager::install(c("graph", "Rgraphviz"))
    ```

    This has been added to the README and vignette. 

- [x] @wlandau devtools::spell_check("Rclean") identifies several
    correctly spelled words. I recommend listing them in an
    inst/WORDLIST file
    ([example here](https://github.com/ropensci/drake/blob/master/inst/WORDLIST)).

    Thanks for this. I have added inst/wordlist.

- [x] @wlandau goddpractice::gp("Rclean") suggests a bunch of style
    fixes I agree with. The styler package can help you turn
    assignment =` into <-`.  Please let me know if you would like
    clarification on any of these notes.
    
    ```r
    It is good practice to
    
      ✖ write unit tests for all functions, and all package code
        in general. 86% of code lines are covered by test cases.
    
        R/clean.R:49:NA
        R/clean.R:72:NA
        R/clean.R:82:NA
        R/clean.R:91:NA
        R/clean.R:95:NA
        ... and 21 more lines
    
      ✖ use '<-' for assignment instead of '='. '<-' is the
        standard, and R users and developers are used it and it is easier
        to read your code for them if you use '<-'.
    
        R/var.id.R:41:44
        R/var.id.R:42:47
    
      ✖ avoid long code lines, it is bad for readability. Also,
        many people prefer editor windows that are about 80 characters
        wide. Try make your lines shorter than 80 characters
    
        R/clean.R:47:1
        R/clean.R:93:1
        R/get.spine.R:44:1
        R/parse.info.R:39:1
        R/parse.info.R:40:1
        ... and 1 more lines
    
      ✖ avoid sapply(), it is not type safe. It might return a
        vector, or a list, depending on the input data. Consider using
        vapply() instead.
    
        R/clean.R:150:29
        R/clean.R:151:55
        R/clean.R:169:34
    
      ✖ avoid 1:length(...), 1:nrow(...), 1:ncol(...),
        1:NROW(...) and 1:NCOL(...) expressions. They are error prone and
        result 1:0 if the expression on the right hand side is zero. Use
        seq_len() or seq_along() instead.
    
        R/get.libs.R:40:13
        R/get.libs.R:42:17
        R/get.libs.R:44:21
        R/var.id.R:39:13
        R/var.lineage.R:43:22
        ... and 4 more lines
    ```

    These have either been fixed or deleted from the
    package. goodpractice::gp() currently reports "Ah! Perfect
    package! Keep up the cat's pajamas work!".

#### Miscellaneous

- [x] @wlandau I am a bit concerned about the scope of the built-in
    unit tests. It would be helpful to test at least one longer script
    to make sure the correct lines get captured in a serious
    workflow. Not only that, but when you actually run the longer
    script and various object-specific scripts generated by clean() ,
    do the output data objects agree?

    A longer script, that is arguably more realistic, has been added
    along with associated tests to check that minimized code for an
    entangled result can be correctly extracted.

- [x] @wlandau What is the reason you chose JSON to store
    retrospective provenance?  Have you considered a tidier format
    such as a long-form data frame? I like how
    [ pkgapi ](https://github.com/r-lib/pkgapi) represents its output.

    This functionality has been removed, but the PROV-JSON format was
    chosen to comply with standards used by the retrospective
    provenance community.

- [x] @wlandau The clean() function is ambitious, long, and deeply
    indented.  Please consider decomposing this monolithic function
    into smaller helper functions. No need to export the helper
    functions or write roxygen2 docstrings. A particularly good
    resource on this kind of refactoring is Jenny Bryan's talk on
    [code smells and feels](https://www.youtube.com/watch?v=7oyiPBjLAWY).

    As mentioned previously, clean() has been refactored and the API
    as a whole has been re-organized to make it more transparent and
    approachable.

- [x] @wlandau Are you open to using
    [ styler ](https://github.com/r-lib/styler) instead of formatR to
    reformat code? It is more modern and more actively maintained.

    Given the higher maintenance activity, Rclean now uses styler.


- [x] @nevrome When I tried to apply clean to some of my own scripts,
    I realized that all packages necessary to run this script have to
    be loaded in the current session. If this was not the case, then I
    got the error message **`Error in as.environment(pos): no item
    called "package:dplyr" on the search list`**.  I got this message
    10+ times for one of my more complex scripts before clean went
    through, until I loaded all the packages. This is a little bit
    tedious. Is there another way to implement package loading? Maybe
    the [automagic](https://github.com/cole-brokamp/automagic) package
    could help to automate that? If this is not possible or if you
    don't want to have an automatic solution, then I would at least
    ask you to catch the current error message and replace it with
    something more intelligible, e.g.  "Package xyz has to be loaded
    to analyze this script.".  

    Sorry you ran into this hurdle with the package. This should now
    no longer be an issue, as it was a product of how the get.libs()
    function found the packages that were being used in the script and
    the need for the retrospective provenance to run the code prior to
    analyzing it. Now, get_libs() no longer needs the packages to be
    loaded and retrospective provenance is no longer used. 

- [x] @nevrome **Internal functions** do not need to be exported (e.g.
    parse.info , read.prov ). Remove the @export tag for these
    functions and add the tags @keywords internal and @noRd .
    
    Agreed, the API has been updated and @noRd has been added where needed.

- [x] @nevrome The ** simple_script.R ** code appears many times in
    the package (in the directories test/ , inst/ , exec/ , example/
    ). I don't think you need this file so many times.

    **simple_script.R** now only occurs in inst/examples.

- [ ] @nevrome Although you not seem to work in RStudio I suggest to
    add a **Rstudio project file** in the root directory (+ the
    necessary additions to .Rbuildignore ). That simplifies
    contributing for RStudio users.

    Yes, I don't work in RStudio, except when I'm teaching. So, I'm
    not sure how to best set this up for using with the package
    dev. If someone who uses RStudio starts to contribute, I would be
    happy to have it added.

- [x] @nevrome In the **travis-ci** setup I suggest to treat warnings
    as errors ( warnings_are_errors: true ). I think this is usual for
    R packages, because no package with warnings can go to CRAN.

    This has been updated to treat warnings as errors.. 

## Final Approval
@wlandau: agree to be listed in DESCRIPTION, need to approve all changes
@nevrome: agree to be listed in DESCRIPTION, need to approve all changes
