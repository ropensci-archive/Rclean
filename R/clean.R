<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<style>body{background-color:white;}</style>
<script src="lib/htmlwidgets-1.5.1/htmlwidgets.js"></script>
<script src="lib/jquery-1.12.4/jquery.min.js"></script>
<link href="lib/datatables-css-0.0.0/datatables-crosstalk.css" rel="stylesheet" />
<script src="lib/datatables-binding-0.10/datatables.js"></script>
<link href="lib/dt-core-1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="lib/dt-core-1.10.19/css/jquery.dataTables.extra.css" rel="stylesheet" />
<script src="lib/dt-core-1.10.19/js/jquery.dataTables.min.js"></script>
<link href="lib/crosstalk-1.0.0/css/crosstalk.css" rel="stylesheet" />
<script src="lib/crosstalk-1.0.0/js/crosstalk.min.js"></script>
<link href="lib/highlight.js-6.2/rstudio.css" rel="stylesheet" />
<script src="lib/highlight.js-6.2/highlight.pack.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link href="lib/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet" />
<link href="lib/bootstrap-3.3.5/css/bootstrap-theme.min.css" rel="stylesheet" />
<script src="lib/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="lib/bootstrap-3.3.5/shim/html5shiv.min.js"></script>
<script src="lib/bootstrap-3.3.5/shim/respond.min.js"></script>

</head>
<body>
<div class="container-fluid">
  <style type="text/css">table tr:hover td {
  font-weight:bold;text-decoration:none
}
table tr.covered td{
  background-color:rgba(95,151,68,0.3)
}

table tr:hover.covered .num{
  background-color:rgba(95,151,68,0.7)
}
table tr.missed td{
  background-color:rgba(185,73,71,0.3)
}
table tr:hover.missed .num{
  background-color:rgba(185,73,71,0.7)
}

table tr.missed:hover td{
  -webkit-box-shadow:0 -2px 0 0 #b94947 inset;
  -moz-box-shadow:0 -2px 0 0 #b94947 inset;
  box-shadow:0 -2px 0 0 #b94947 inset
}
table tr.covered:hover td{
  -webkit-box-shadow:0 -2px 0 0 #5f9744 inset;
  -moz-box-shadow:0 -2px 0 0 #5f9744 inset;
  box-shadow:0 -2px 0 0 #5f9744 inset
}

table tr.never td{
  background-color:transparent
}

table tbody {
  border-style: solid;
  border: 1px solid rgba(0,0,0,0.1)
}

table .num {
  border-right: 1px solid rgba(0,0,0,0.1)
}

td.coverage em {
  opacity: 0.5;
}

table td.coverage {
  border-right: 1px solid rgba(0,0,0,0.1);
  font-weight: bold;
  text-align: center;
}
table.table-condensed pre {
  background-color: transparent;
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 11px;
}
div#files td {
  padding: 0;
  padding-left: 5px;
}

div#files td.num {
  padding-right: 5px;
}

table.table-condensed {
  font-size: 11px;
}</style>
  <div class="col-md-8 col-md-offset-2">
    <h2>Rclean coverage - 89.69%</h2>
    <div class="tabbable">
      <ul class="nav nav-tabs" data-tabsetid="covr">
        <li class="active">
          <a href="#tab-covr-1" data-toggle="tab" data-value="Files">Files</a>
        </li>
        <li>
          <a href="#tab-covr-2" data-toggle="tab" data-value="Source">Source</a>
        </li>
      </ul>
      <div class="tab-content" data-tabsetid="covr">
        <div class="tab-pane active" title="Files" data-value="Files" id="tab-covr-1">
          <div id="htmlwidget-cd9d3319c2586033200b" style="width:100%;height:500px;" class="datatables html-widget"></div>
          <script type="application/json" data-for="htmlwidget-cd9d3319c2586033200b">{"x":{"filter":"none","fillContainer":true,"data":[["<a href=\"#\">R/keep.R<\/a>","<a href=\"#\">R/clean.R<\/a>","<a href=\"#\">R/get_libs.R<\/a>","<a href=\"#\">R/get_vars.R<\/a>","<a href=\"#\">R/code_graph.R<\/a>","<a href=\"#\">R/var_lineage.R<\/a>"],[56,164,48,50,58,72],[6,39,7,7,13,22],[5,33,6,6,12,22],[1,6,1,1,1,0],["1","5","1","1","2","6"],["83.33%","84.62%","85.71%","85.71%","92.31%","100.00%"]],"container":"<table class=\"row-border fill-container\">\n  <thead>\n    <tr>\n      <th>File<\/th>\n      <th>Lines<\/th>\n      <th>Relevant<\/th>\n      <th>Covered<\/th>\n      <th>Missed<\/th>\n      <th>Hits / Line<\/th>\n      <th>Coverage<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"searching":false,"dom":"t","paging":false,"columnDefs":[{"targets":6,"createdCell":"function(td, cellData, rowData, row, col) {\n  var percent = cellData.replace(\"%\", \"\");\n  if (percent > 90) {\n    var grad = \"linear-gradient(90deg, #edfde7 \" + cellData + \", white \" + cellData + \")\";\n  } else if (percent > 75) {\n    var grad = \"linear-gradient(90deg, #f9ffe5 \" + cellData + \", white \" + cellData + \")\";\n  } else {\n    var grad = \"linear-gradient(90deg, #fcece9 \" + cellData + \", white \" + cellData + \")\";\n  }\n  $(td).css(\"background\", grad);\n}\n"},{"className":"dt-right","targets":[1,2,3,4]}],"order":[],"autoWidth":false,"orderClasses":false},"callback":"function(table) {\ntable.on('click.dt', 'a', function() {\n  files = $('div#files div');\n  files.not('div.hidden').addClass('hidden');\n  id = $(this).text();\n  files.filter('div[id=\\'' + id + '\\']').removeClass('hidden');\n  $('ul.nav a[data-value=Source]').text(id).tab('show');\n});\n}"},"evals":["options.columnDefs.0.createdCell","callback"],"jsHooks":[]}</script>
        </div>
        <div class="tab-pane" title="Source" data-value="Source" id="tab-covr-2">
          <div id="files">
            <div id="R/var_lineage.R" class="hidden">
              <table class="table-condensed">
                <tbody>
                  <tr class="never">
                    <td class="num">1</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># This file is part of Rclean</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">2</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">3</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is free software; you can redistribute it and/or</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">4</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># modify it under the terms of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">5</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># as published by the Free Software Foundation; either version 2</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">6</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># of the License, or (at your option) any later version.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">7</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">8</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is distributed in the hope that it will be useful,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">9</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># but WITHOUT ANY WARRANTY; without even the implied warranty of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">10</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">11</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># GNU General Public License for more details.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">12</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">13</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># You should have received a copy of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">14</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># along with Rclean; if not, write to the Free Software Foundation,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">15</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">16</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">17</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Contact: Matthew Lau &lt;matthewklau@fas.harvard.edu&gt;</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">18</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">19</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">20</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' var_lineage --- Determine the lineage of objects contained in an R</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">21</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">22</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">23</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' Determine the series of steps that leads to the production of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">24</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' objects contained in a script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">25</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">26</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param src A Script object from readScript the CodeDepends</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">27</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     package.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">28</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @return A list containing a graph (g) describing the lineage of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">29</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     objects with steps (i.e. complexes of function and operation</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">30</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     calls) listed as numbers that "use" or "create" data objects</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">31</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     and a variable data frame (vdf) containing details of the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">32</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     variables (var) and, possibly, unique identifiers (uid) that</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">33</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     were used or created by each step.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">34</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @importFrom CodeDepends getDetailedTimelines</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">35</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @importFrom CodeDepends getInputs</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">36</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @noRd</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">37</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">38</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">39</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">var_lineage &lt;- function(src = "script"){</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">40</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## variable data frame</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">41</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    vdf &lt;- getDetailedTimelines(info = getInputs(src))</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">42</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    rownames(vdf) &lt;- seq(1, nrow(vdf))</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">43</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## lineage graph</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">44</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                                        # defined by</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">45</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    def.by &lt;- do.call(cbind, </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">46</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                      split(as.numeric(vdf[, "defined"]), </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">47</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                            vdf[, "var"]))</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">48</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    rownames(def.by) &lt;- seq(1, nrow(def.by))</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">49</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                                        # used by</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">50</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    use.by &lt;- do.call(cbind, </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">51</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                      split(as.numeric(vdf[, "used"]), </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">52</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                            vdf[, "var"]))</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">53</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    rownames(use.by) &lt;- seq(1, nrow(use.by))</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">54</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                                        # full lineage graph</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">55</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                                        # adding empty subgraphs</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">56</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    def.by &lt;- cbind(</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">57</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        array(0, dim = rep(nrow(def.by), 2)), </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">58</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        def.by</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">59</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    )</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">60</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    colnames(def.by)[seq(1, nrow(def.by))] &lt;- seq(1, nrow(def.by))</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">61</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    use.by &lt;- cbind(</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">62</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        t(use.by), </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">63</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        array(0, dim = rep(ncol(use.by), 2))</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">64</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    )</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">65</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                                        # sub-graph range</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">66</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    sg.range &lt;- seq((ncol(use.by) - nrow(use.by) + 1), ncol(use.by))</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">67</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                                            # rename nodes</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">68</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    colnames(use.by)[sg.range] &lt;- rownames(use.by)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">69</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    lg &lt;- rbind(def.by, use.by)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">70</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    out &lt;- list(g = lg, vdf = vdf)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">71</td>
                    <td class="coverage">6<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    return(out)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">72</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div id="R/keep.R" class="hidden">
              <table class="table-condensed">
                <tbody>
                  <tr class="never">
                    <td class="num">1</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Copyright (C) 2017 Harvard University, Mount Holyoke College</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">2</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">3</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># This file is part of Rclean</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">4</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">5</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is free software; you can redistribute it and/or</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">6</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># modify it under the terms of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">7</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># as published by the Free Software Foundation; either version 2</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">8</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># of the License, or (at your option) any later version.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">9</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">10</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is distributed in the hope that it will be useful,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">11</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># but WITHOUT ANY WARRANTY; without even the implied warranty of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">12</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">13</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># GNU General Public License for more details.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">14</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">15</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># You should have received a copy of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">16</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># along with Rclean; if not, write to the Free Software Foundation,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">17</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">18</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">19</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Contact: Matthew Lau &lt;matthewklau@fas.harvard.edu&gt;</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">20</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">21</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' keep --- Copy code to clipboard or write a specified file.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">22</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' OUTPUT = Copies code to the clipboard or writes out code from an</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">23</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' object to a specified file.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">24</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">25</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' Simplifies writing and copying code to clipboard by removing the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">26</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' need to separately create and specify a file connection or to send</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">27</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' code to the clipboard.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">28</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">29</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param x Line(s) of code.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">30</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param file Path to write code. If not specified, code is copied to</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">31</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     the clipboard.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">32</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @return The code is copied to the clipboard or written to disk.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">33</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @importFrom utils sessionInfo</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">34</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @export keep</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">35</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @importFrom clipr write_clip</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">36</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">37</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @examples</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">38</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' \dontrun{</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">39</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' clean.code &lt;- data(simple_script)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">40</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' ## Copies code to your clipboard</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">41</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' keep(clean.code)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">42</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' ## Saves code to your disk</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">43</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' keep(clean.code, file = "clean_code.R")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">44</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' }</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">45</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">46</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">47</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">keep &lt;- function(x, file = NULL){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">48</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (is.null(file)){</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">49</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        write_clip(x)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">50</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else{</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">51</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        file.create(file)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">52</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        fileConn &lt;- file(file)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">53</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        writeLines(x, fileConn)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">54</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        close(fileConn)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">55</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">56</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div id="R/code_graph.R" class="hidden">
              <table class="table-condensed">
                <tbody>
                  <tr class="never">
                    <td class="num">1</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># This file is part of Rclean</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">2</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">3</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is free software; you can redistribute it and/or</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">4</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># modify it under the terms of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">5</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># as published by the Free Software Foundation; either version 2</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">6</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># of the License, or (at your option) any later version.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">7</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">8</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is distributed in the hope that it will be useful,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">9</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># but WITHOUT ANY WARRANTY; without even the implied warranty of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">10</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">11</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># GNU General Public License for more details.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">12</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">13</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># You should have received a copy of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">14</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># along with Rclean; if not, write to the Free Software Foundation,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">15</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">16</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">17</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Contact: Matthew Lau &lt;matthewklau@fas.harvard.edu&gt;</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">18</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">19</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'code_graph --- A network diagram of computational dependencies. </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">20</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">21</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' Plot the dependencies among functions and objects for a given script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">22</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">23</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@param script Script object from CodeDepends or a file path to a script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">24</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@param pdf.file Path to output PDF of the code graph.  </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">25</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@return A network plot.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">26</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom igraph graph_from_adjacency_matrix</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">27</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom igraph igraph.to.graphNEL</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">28</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom Rgraphviz plot</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">29</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom grDevices pdf</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">30</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom grDevices dev.off</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">31</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@export code_graph</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">32</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">33</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@examples</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">34</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'\dontrun{</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">35</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' script &lt;- system.file("example", "simple_script.R", package = "Rclean")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">36</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' simple.script &lt;- readScript(script)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">37</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' code_graph(simple.script)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">38</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'}</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">39</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">40</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">code_graph &lt;- function(script, pdf.file){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">41</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (class(script) == "character"){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">42</td>
                    <td class="coverage">2<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        src &lt;- readScript(script[1])</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">43</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else if (class(script) == "Script"){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">44</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        src &lt;- script</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">45</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else{</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">46</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        stop("Error: Please provide a Script object or script file path.")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">47</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">48</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    g &lt;- var_lineage(src)[["g"]]</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">49</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ig &lt;- graph_from_adjacency_matrix(g)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">50</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    gNEL &lt;- igraph.to.graphNEL(ig)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">51</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (missing(pdf.file)){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">52</td>
                    <td class="coverage">2<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        plot(gNEL)    </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">53</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else{</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">54</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        pdf(pdf.file)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">55</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        plot(gNEL)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">56</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        dev.off()</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">57</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">58</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div id="R/get_libs.R" class="hidden">
              <table class="table-condensed">
                <tbody>
                  <tr class="never">
                    <td class="num">1</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># This file is part of Rclean</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">2</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">3</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is free software; you can redistribute it and/or</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">4</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># modify it under the terms of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">5</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># as published by the Free Software Foundation; either version 2</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">6</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># of the License, or (at your option) any later version.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">7</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">8</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is distributed in the hope that it will be useful,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">9</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># but WITHOUT ANY WARRANTY; without even the implied warranty of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">10</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">11</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># GNU General Public License for more details.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">12</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">13</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># You should have received a copy of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">14</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># along with Rclean; if not, write to the Free Software Foundation,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">15</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">16</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">17</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Contact: Matthew Lau &lt;matthewklau@fas.harvard.edu&gt;</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">18</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">19</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">20</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'get_libs --- Determine the libraries referenced in a given script. </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">21</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">22</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">23</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">24</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@param file Path to the script. </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">25</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@return Returns the libraries referenced in the script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">26</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom CodeDepends getInputs</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">27</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom CodeDepends readScript</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">28</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom methods slot</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">29</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@export get_libs</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">30</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">31</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@examples</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">32</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' script &lt;- system.file(</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">33</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         "example", </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">34</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         "long_script.R", </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">35</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         package = "Rclean")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">36</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' get_libs(script)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">37</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">38</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">get_libs &lt;- function(file){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">39</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (class(file) == "Script"){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">40</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        src &lt;- file</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">41</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else{</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">42</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        src &lt;- readScript(file)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">43</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">44</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    cd &lt;- getInputs(src)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">45</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    libs &lt;- unlist(lapply(cd, slot, name = "libraries"))</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">46</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    libs &lt;- unique(libs)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">47</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    return(libs)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">48</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div id="R/clean.R" class="hidden">
              <table class="table-condensed">
                <tbody>
                  <tr class="never">
                    <td class="num">1</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># This file is part of Rclean</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">2</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">3</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is free software; you can redistribute it and/or</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">4</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># modify it under the terms of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">5</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># as published by the Free Software Foundation; either version 2</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">6</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># of the License, or (at your option) any later version.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">7</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">8</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is distributed in the hope that it will be useful,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">9</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># but WITHOUT ANY WARRANTY; without even the implied warranty of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">10</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">11</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># GNU General Public License for more details.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">12</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">13</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># You should have received a copy of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">14</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># along with Rclean; if not, write to the Free Software</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">15</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">16</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># 02110-1301, USA.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">17</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">18</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Contact: Matthew Lau &lt;matthewklau@fas.harvard.edu&gt;</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">19</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">20</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' clean --- Clean code.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">21</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">22</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' Reduce the size and complexity of a analytical script through</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">23</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' algorithmic detection of the essential code needed to produce a set</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">24</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' of results.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">25</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">26</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param script File path to a script or a Script object from</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">27</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     CodeDepends.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">28</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param vars The name of the variable(s) of interest.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">29</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param format LOGICAL: should the minimized code be re-formatted</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">30</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     following common syntax style guides?</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">31</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @return A character vector containing a minimized script based on</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">32</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     the given input variable or set of variables.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">33</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @importFrom CodeDepends readScript</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">34</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @importFrom styler style_text</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">35</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @export clean</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">36</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">37</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @examples</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">38</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' script &lt;- system.file(</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">39</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         "example", </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">40</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         "simple_script.R", </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">41</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         package = "Rclean")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">42</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' clean(script)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">43</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' clean(script, "mat")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">44</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' clean(script, "tab.12")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">45</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' clean(script, c("mat", "tab.12", "out"))</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">46</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">47</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">clean &lt;- function(script, vars, format = TRUE){</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">48</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## Check if file is passing a script object</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">49</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (class(script) == "Script"){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">50</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        src &lt;- script</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">51</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else{</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">52</td>
                    <td class="coverage">2<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        src &lt;- readScript(script)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">53</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">54</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## Check if a variable has been supplied, then find</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">55</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## minimal code.</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">56</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (missing(vars)){</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">57</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        print(paste("Please supply at least one variable:"))</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">58</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        out &lt;- get_vars(src)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">59</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else{</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">60</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        ## Reduce to the minimal code</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">61</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        out &lt;- min_code(src, vars)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">62</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        ## Reformat code using styler?</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">63</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        if (format){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">64</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">            out &lt;- style_text(out)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">65</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        }</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">66</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">67</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    return(out)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">68</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">69</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">70</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' min_code --- Get the minimum code from a script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">71</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">72</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' Extract the minimal code for required for one or more variables</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">73</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' from a longer script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">74</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">75</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param src Script object.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">76</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param vars The name of the variable(s) of interest.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">77</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @noRd</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">78</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">79</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">min_code &lt;- function(src = "script", vars = "variables") {</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">80</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## Define the lineage for all variables</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">81</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    vl &lt;- var_lineage(src)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">82</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## Find the lines and variables for all vars</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">83</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    vp &lt;- lapply(vars, get_path, g = vl[["g"]])</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">84</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## Subest graphs with only required nodes for each var</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">85</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    g.min &lt;- min_graph(vp, vl)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">86</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## Create a set list of lines for subsetting</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">87</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    l.min &lt;- rownames(g.min)[is_number(rownames(g.min))]</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">88</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    ## Subsest the code to the minimum lines</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">89</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    out &lt;- as.character(src[as.numeric(l.min)])</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">90</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    return(out)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">91</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">92</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">93</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' min_graph --- Minimize a graph to a list of paths.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">94</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param vp A path of variables from a depth first search.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">95</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param vl Variable lineage data frame.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">96</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @return Produces a graph in matrix form only containing code</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">97</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     relevant to provided path.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">98</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @noRd</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">99</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">100</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">min_graph &lt;- function(vp = "variable path", vl = "variable lineage") {</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">101</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    g.min &lt;- vl[["g"]]</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">102</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    nodes &lt;- unique(unlist(vp))</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">103</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    g.min &lt;- g.min[rownames(g.min) %in% nodes, colnames(g.min) %in% nodes]</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">104</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    return(g.min)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">105</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">106</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">107</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' get_path --- Lineage pathway for a given variable.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">108</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">109</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' Isolates the lineage for an variable. This can be either all steps</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">110</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' leading to the creation of a variable or all descendent steps that</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">111</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' use that variable.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">112</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">113</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@param g An adjacenty matrix that presents the use and creation of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">114</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     variables by steps (i.e. complexes of function and operation</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">115</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     calls).</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">116</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@param node.id The name of the variable of interest.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">117</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@param direction Determines the direction of searching on the graph,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">118</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     either "in" (path leading to a variable) or "out" (path leading</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">119</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     from a variable).</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">120</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@return A character vector of steps and objects found along the path</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">121</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     for the object identified by the node ID.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">122</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom igraph graph_from_adjacency_matrix</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">123</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom igraph dfs</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">124</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@importFrom stats na.omit</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">125</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@noRd</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">126</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'@author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">127</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">128</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">get_path &lt;- function(g = "graph", </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">129</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                     node.id, </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">130</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                     direction = "in") {</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">131</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (mode(g) == "list" &amp; any(names(g) == "g")){</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">132</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        g &lt;- g[["g"]]</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">133</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">134</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (missing(node.id)){</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">135</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        warning("Please supply a node name.")</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">136</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        print("Possible node names:", quote = FALSE)</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">137</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        rownames(g)[!(is_number(rownames(g)))]</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">138</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else{</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">139</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        ig &lt;- graph_from_adjacency_matrix(g)</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">140</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        dfs.result &lt;- dfs(ig, node.id, </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">141</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                       direction, </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">142</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">                       unreachable = FALSE)$order</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">143</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        out &lt;- as.character(na.omit(names(dfs.result)))</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">144</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        if (direction == "in"){out &lt;- out[seq(length(out), 1)]}</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">145</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">146</td>
                    <td class="coverage">4<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">return(out)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">147</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">148</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">149</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">## is_number --- Detect numbers in a character vector of variables.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">150</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param x A character vector indicating names of variables.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">151</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @return Produces a logical vector indicating which items in the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">152</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     original vector are likely numbers. </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">153</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @noRd</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">154</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">155</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">is_number &lt;- function(x) {</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">156</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    out &lt;- logical()</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">157</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    for (i in seq_along(x)) {</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">158</td>
                    <td class="coverage">38<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        out[i] &lt;- !(any(</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">159</td>
                    <td class="coverage">38<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">               strsplit(x[i], split = "")[[1]] %in% </pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">160</td>
                    <td class="coverage">38<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">               c(letters, LETTERS)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">161</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">           ))</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">162</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">163</td>
                    <td class="coverage">3<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    return(out)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">164</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div id="R/get_vars.R" class="hidden">
              <table class="table-condensed">
                <tbody>
                  <tr class="never">
                    <td class="num">1</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># This file is part of Rclean</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">2</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">3</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is free software; you can redistribute it and/or</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">4</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># modify it under the terms of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">5</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># as published by the Free Software Foundation; either version 2</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">6</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># of the License, or (at your option) any later version.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">7</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">8</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Rclean is distributed in the hope that it will be useful,</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">9</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># but WITHOUT ANY WARRANTY; without even the implied warranty of</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">10</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">11</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># GNU General Public License for more details.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">12</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">13</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># You should have received a copy of the GNU General Public License</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">14</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># along with Rclean; if not, write to the Free Software</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">15</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">16</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># 02110-1301, USA.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">17</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">18</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"># Contact: Matthew Lau &lt;matthewklau@fas.harvard.edu&gt;</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">19</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">20</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' get_vars --- Get the variables that are created in a script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">21</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">22</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' Determining the variables that are created in a script is useful</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">23</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' for orienting code cleaning (i.e. refactoring) efforts.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">24</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">25</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @param script File path to a script or a Script object from</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">26</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'     CodeDepends.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">27</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @return A list of variables from a given script.</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">28</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @importFrom CodeDepends readScript</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">29</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @importFrom CodeDepends getVariables</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">30</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @export get_vars</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">31</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @author Matthew K. Lau</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">32</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' @examples</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">33</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' script &lt;- system.file(</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">34</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         "example", </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">35</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         "simple_script.R", </pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">36</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#'         package = "Rclean")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">37</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">#' get_vars(script)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">38</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">39</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">get_vars &lt;- function(script){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">40</td>
                    <td class="coverage">2<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    if (class(script) == "character"){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">41</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        src &lt;- readScript(script[1])</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">42</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else if (class(script) == "Script"){</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">43</td>
                    <td class="coverage">1<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">        src &lt;- script</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">44</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }else{</pre>
                    </td>
                  </tr>
                  <tr class="missed">
                    <td class="num">45</td>
                    <td class="coverage">!</td>
                    <td class="col-sm-12">
                      <pre class="language-r">        stop("Error: Please provide a Script object or script file path.")</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">46</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    }</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">47</td>
                    <td class="coverage">2<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    out &lt;- unique(getVariables(src))</pre>
                    </td>
                  </tr>
                  <tr class="covered">
                    <td class="num">48</td>
                    <td class="coverage">2<em>x</em></td>
                    <td class="col-sm-12">
                      <pre class="language-r">    return(out)</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">49</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r">}</pre>
                    </td>
                  </tr>
                  <tr class="never">
                    <td class="num">50</td>
                    <td class="coverage"></td>
                    <td class="col-sm-12">
                      <pre class="language-r"></pre>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <script>$('div#files pre').each(function(i, block) {
    hljs.highlightBlock(block);
});</script>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
