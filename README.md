# My Vim Configuration

__Version 0.8  (2013-09-29)__

Everyone should try this awesome vim config. It is clean, easy to use
out of the box, well organized and easy to fork and maintain.

# How to install

## Install a bunch of tools needed

For Mac OS, you can just use my script (require brew installed). This will
install some necessory tools and the latest vim (7.4) with lua support.

    curl -L https://raw.github.com/liangxianzhe/dotvim/master/prepare_mac.sh | sh

For Linux, you will need to figure out what the above script does, and install them
according (apt-get etc). Please note a vim with lua support is needed. 

## Set up the vim:

First delete your ~/.vimrc and ~/.vim (backup if you like), then run:

    curl -L https://raw.github.com/liangxianzhe/dotvim/master/install.sh | sh

This will clone the repo to your current folder, then link to ~/.vimrc and ~/.vim.

Now open vim, it will set up a bunch of plugins at the first time. Then you are
all set.

If you prefer mannual setup or care what has been done, please read the sript.

# Configuration

You can overwrite default configuration and key bindings by using one of 
following files:

`~/.vim/before.vimrc` will be loaded before everything else.

`~/.vim/extra.vimrc` will be loaded after bundles are initialized and before
the settings take place. The idea was so people could add Bundle lines
without having to worry about conflicts in vimrc when pulling. 

`~/.vim/after.vimrc` will be loaded after all configuration options are set. 
This is the best place to change default behaviour (keybindings) or
color scheme.

# Acknowledgments 

Obviously I steal a lot work from others. Here is my special thanks to:

Joe Di Castro (joedicastro)'s 
[dotfiles](https://github.com/joedicastro/dotfiles/tree/master/vim). Most part 
of this config is from Joe, including large amount of this README.  His idea of
using Unite to create UI for vim commands is brilliant.

Zaiste! (zaiste)'s [vimified](https://github.com/zaiste/vimified). Thanks to his 
setup script.

They are not using any licence. But some dotfiles I borrow is using MIT license,
so I go for MIT license as well.

# Usage

First please note:
> `<Leader>` key is mapped to `,` 

> `<LocalLeader>` key is mapped to `<space>`

> `<LocalLeader>u` i.e. `<space>u` will trigger the awesome Unite UI 

First give you a sense how the Unite UI looks like.

![intro](https://raw.github.com/liangxianzhe/dotvim-image/master/intro.gif "intro)

The rest of this doc will introduce most features or tools I use.

First you will get to know the awesome Unite and how we use it.

[Unite](#unite)

Then all feature are organized as packages. Each package is a .vimrc file. We
got a lot of benifit from modulization.

- Each package is short, easy to read. (Totally 1600+ lines vimrc is not fun to 
read)
- You can add a package you need (for example, java or ruby), and share with 
people or send a pull-request. 
- You can ignore the package you don't need by setting a parameter 
`g:dotvim_packages` in local.vimrc.

Here is current packages.

[Unite](#unite)

[Unite](#unite)

[Unite](#unite)

[Unite](#unite)

[Unite](#unite)

<a name="unite"/>
## Unite

Unite is an interface that unifies various "query results" under a common
aspect and that follows Vim's default behavior (modal). It's almost an API
that we can use to build our own solutions. In fact, the author describes it as
"unite and create interfaces". With Unite you can open a file, change the
buffer, choose a colorscheme, make a regex search (grep, Ack, Ag, ...), etc.
Even you can take a look at the Vim registers, messages, help, command, functions,
... In short, it is a Swiss army knife that, well used, allows us to replace
several different plugins with only one (in this case: CtrlP, Ack, YankRing,
TagmaTasks and Tagbar).

> One of the main advantages of Unite is that it allows me to address one of the
problems that I initially tried to resolve with this document, which is to
remember all the options and mappings that, with so much effort and time, I added
to my Vim configuration. It's pretty normal that we have a plugin installed and
customized but do not use it frequently. Then when we need it, we don't remember
a thing about it. Not the mappings, nor the commands, nor even its name. Well,
with Unite it is easy to create a menu for the plugin where we show the options
it has and its mappings, and, thanks again to the magic of Unite, we don't even
need to remember the mapping of this menu, we can look for it in the Unite menu for
menus. __Problem solved quickly and gracefully.__

The mayor drawback of Unite and also one of its greatest advantages is that it
comes hardly configured, leaving to our own judgement and responsibility the
way we set it to work to our liking. In fact, we can make our own Unite plugins
to make new Unite sources and scratch your itches.

### Sources and Menus

I set Unite following two different ways. On one hand I use it to access
Unite sources via mappings with the `<Leader>` key, and secondly calling Unite
menus through `<LocalLeader>` key mappings.

- The __sources__ that I call from a `<Leader>` mapping are used to access the
  most common tasks, like open files, search inside the buffer, do regex
  searchs (grep), etc. Here is an example of how to open a file in this way:

    ![unite_file](http://joedicastro.com/static/pictures/unite_file_en.gif "unite file")

- The __menus__ are used to group options either by plugins or by functionality.
  Also shows the mappings for all of those options that have one, this allows me
  to avoid looking for them in the `~/.vimrc` file when I forget one. The next
  image shows a Unite menu for managing a git repository:

    ![unite_git](http://joedicastro.com/static/pictures/unite_git_en.gif "unite_git")

Unite has a master menu that shows all the custom menus that we have created,
allowing us to access them and see the mapping associated with each one. This
menu doesn't show the mappings by design, but I arranged their descriptions to
allow that. This is what the Vim command `:menu` should have been: *comfortable,
intuitive and easy to navigate.*

- `<LocalLeader>u` or `:Unite menu` shows the available menus

![unite menu](http://joedicastro.com/static/pictures/unite_menu_en.png "unite menu")

### Navigation inside Unite

These are some of the available mappings:

> __Mappings__

> __Normal__ mode:

> - `q` exit from Unite and submenus
> - `Q` exit from Unite and all submenus
> - `i` change to insert mode
> - `v` change to visual mode
> - `<Tab>` choose an action
> - `a` choose an action for the selected candidate or add text at the end of
>   the prompt
> - `<C-R>` reset the menu
> - `<Space>` mark the current candidate
> - `*` mark all candidates
> - `M` removes the candidate number limit
> - `gg`, `G`, `j`, `k` typical Vim moves to move around candidates
> - `?` shows help (mappings)
> - `N` add a new candidate (only where have sense)
> - `.` show hidden files (dotfiles)

>     *With a candidate selected:*

>     - `<CR>` execute the default action
>     - `b` add it to bookmarks
>     - `d` delete it
>     - `e` expand the path
>     - `t` open the candidate in a new tab
>     - `yy` do a yank
>     - `p` preview it
>     - `x` launch the quick selection

> __Insert__  mode:

> - `<ESC>` change to normal mode
> - `<Tab>` choose an action
> - `<CR>`  execute the default action
> - `<C-G>` exit Unite
> - `<C-D>` delete it
> - `<C-E>` expand the path
> - `<C-T>` open the candidate in a new tab
> - `<C-Y>` do a yank
> - `<C-N>`, `<C-P>`, `<C-F>` y `<C-B>` Vim motions to move around candidates

>     *With a candidate selected:*

>     - `<Space>` mark the current candidate

> __Visual__ mode:

> - `<Space>` mark the current candidate

## Managing Plugins

![neobundle](http://joedicastro.com/static/pictures/unite_menu_neobundle_en.png "neobundle")

A plugin to rule them all! NeoBundle allows us to manage the rest of the plugins,
itself included. __I have it configured to auto install itself and all of the
plugins when Vim is executed for the first time__.

The advantages of NeoBundle versus Vundle and other similar plugins are the
following:

- Allows to use another VCS other than git (hg, svn), even a local dir
- Allows revision lock or even set a plugin to not be updated
- Supports lazy initialization of plugins to optimizing startup time
- Supports multiple config options per plugin, like automatic building if needed
- and so on...

The best way to use NeoBundle is through Unite:

__Unite__

- `<LocalLeader>n` or `:Unite menu:neobundle`, shows the NeoBundle menu

### Menu

These are the menu entries in detail:

- *neobundle* shows the installed plugins as candidates. Via the actions we can
  delete them, browse the repository page, ...

- *log* shows the last NeoBundle log

- *lazy* shows all the installed plugins configured as Lazy. Those are loaded on
  demand and allow us to have a lot of plugins installed that are not frequently
  used without delaying the vim startup. I use this option a lot in this
  configuration.

- *update* updates all the plugins automatically (and installs those not already
  installed)

- *search* searches plugins by name on vim.org & GitHub (duplicates prone)

- *install* installs all the plugins already present in the `.vimrc` file or in
  the `direct_bundles.vim` file that are not yet installed

- *check* checks if all the plugins are already installed, and if not, prompt
  for their installation

- *docs* installs help docs for all plugins manually

- *clean* deletes, upon confirmation, those plugin folders that are no longer
  needed because they are not still installed

- *list* lists all the installed plugins

- *direct edit* edits the `~/.vim/bundle/.neobundle/direct_bundles.vim` file
  where NeoBundle stores those plugins installed directly (e.g. via NeoBundle
  search)

> __Plugins updating__

> Since we often install plugins from repositories, we are exposed to error-
> prone updates. Once in a while, a plugin update introduces a bug and you end up
> with an unstable configuration until that bug is fixed (which may take a while).
> If we use Vim for work, that is very inconvenient.

> A way to avoid this is by using symbolic links and backups of our vim folder.
> If we made a backup of our vim config before an update, is easy to restore it
> to a previous stable state without much effort. But this is tedious and
> error-prone too. And alternative is managing this via NeoBundle. We can use
> the revision lock feature to specify what revision we want to install or even
> say to NeoBundle that a plugin should not be updated. But it is not a perfect
> solution either, and very manual. Maybe in a future, we could do plugin
> rollbacks...

## Colorschemes

![unite_colorscheme](http://joedicastro.com/static/pictures/unite_colorscheme_en.gif "unite colorscheme")

To choose a colorscheme we can do it easily and comfortably with an included
preview through a Unite menu:

__Unite__

- `<LocalLeader>v` or `:Unite menu:vim` shows the *vim* menu where we can access
  to an option to choose the colorscheme
- `:Unite colorscheme -auto-preview` choose the colorscheme from the candidates


## Navigation

![unite navigation](http://joedicastro.com/static/pictures/unite_menu_navigation.png "unite navigation")

>   __Mappings__

> In addition to the options available on the menui, I have set a number of
> mappings that make it much easier to manage windows

>   - `<C-H>` move to the next window to the left
>   - `<C-J>` move to the lower window
>   - `<C-K>` move to the upper window
>   - `<C-L>` move to the next window to the right

__Unite__

`<LocalLeader>b` or `:Unite menu:navigation` shows the navigation menu

### Menu

- The first three menu entries let us to easily move to the chosen buffer, tab,
  or window from the candidates

- *location list* and *quickfix* to access these windows content through
  Unite interface

- *resize windows* use the winresizer plugin to easily resize the windows

    > __Mappings__
    >
    > - `h`, `j`, `k`, `l` use vim motions to move the windows separator
    > - `<ESC>` end the resizing
    > - `q` cancel the resizing

- the next two entries are for creating new windows (horizontal and vertical) and
  the third one is to close any window (except the last)

- *toggle quickfix window* toggle the quickfix window, also close the location
  list if is opened

- *zoom* make zoom in a window

- *delete buffer* delete a buffer


## Bookmarks

![unite bookmarks](http://joedicastro.com/static/pictures/unite_menu_bookmarks.png "unite bookmarks")

With this menu we can manage the bookmarks easily.

__Unite__

`<LocalLeader>m` or `:Unite menu:bookmarks` shows the bookmarks menu


## Text Edition

![unite text](http://joedicastro.com/static/pictures/unite_menu_text.png "unite text")

This menu groups several options to edit text

__Unite__

`<LocalLeader>e` or `:Unite menu:text` shows the text menu

### Menu

- *toggle search results highlight* toggle the search results highlight,
  obviously

- *toggle line numbers* toggle between the four possible visualizations of the
  line numbers column: none, relative (two forms), and absolute

- *toggle wrapping* toggle automatic wrapping and the vertical column color. The
  vertical column that indicates wrapping threshold turns green when the
  automatic wrapping is disabled

- *show hidden chars* show the hidden chars, those that are not printable
  (tabs, carriage returns, spaces, ...)

- the next three entries are to fold/unfold the folds in our doc, one by one or
  all at the same time

- and the three after those allows us to copy/paste from system clipboard and
  for toggle the paste mode.

- *remove trailing whitespaces* delete those empty and almost never significant
  spaces at the end of the line

- *text statistics* show the number of columns, lines, words, chars and
  bytes in total and for the current position

- *show word frequency* show the number of times that each word appears in the text

- *show available digraphs* show a table with all the digraphs available and
  the pair of chars needed to generate each of them.

- *insert lorem ipsum text* insert a text block containing the famous [Lorem
  Ipsum][lorem] text

   [lorem]: http://es.wikipedia.org/wiki/Lorem_ipsum

- *show current char info* show extended info about the current character.
  The info includes the decimal Unicode value, hexadecimal, octal, Unicode name,
  HTML entity, Emoji code and any digraph available.

### Other tools

Apart from the tools included in the menu, and apart from the Vanilla Vim ones
too, we have another bunch of tools available to help us to edit the text more
easily.

- __text-objects__ these are customized text objects that allow us to extend the
  Vim motions defined by default (word, sentence, paragraph, block,
  delimiters, and markup tags) and be able to use more efficient text
  selections. In this config I added the following ones:

    > - __line__ select a line by `al` or `il`
    > - __underscore__ select the text surrounded by underscores via `a_` or
    >   `i_`
    > - __all the buffer__ select the entire buffer. We can use `ae` and `ie`
    > - __indent__ select a indentation level. Options: `ai`, `ii`,
    >   `aI`, `iI`. `i` select the current level and the nested ones, `I` only
    >   selects the current indent level
    > - __last search__ select the last search term results. Options:: `a/`,
    >   `i/`, `a?` and `i?`
    > - __python class__ in a Python code file, selects a class by `aC`, `iC`
    >   and `C`
    > - __python method or function__ same as above for methods and functions
    >   via `aM`, `iM` and `M`

- __vim-commentary__ an extremely easy tool to toggle commentary in lines and
  visual selections. We only need to enter a mapping and a movement to do the
  action, as simple as that.

    ![commentary](http://joedicastro.com/static/pictures/commentary_en.gif "commentary")

    > __Mapping__
    >
    >  - `<Leader>c` or `gc` toggle the commentary

- __vim-surround__ surround a vim text object with a pair of symmetrical
  chars.  We can also remove or change the ones already there

    ![surround](http://joedicastro.com/static/pictures/surround_en.gif "surround")

    > __Mappings__

    > - `ys{motion or text-object}{char}` create surround (*'your surround'*)
    > - `cs{orig_char}{dest_char}` change surround
    > - `ds{char}` delete surround
    > - `S{char}` for create surrounds in visual mode

    > *If we choose the first member of a pair, e.g '(', then the surround is
    > created with a whitespace between the char and the selection. If the last
    > is choosen, e.g. ')', then the extra space is not added.*

- __vim-speeddating__ provides a smart way to increase/decrease time values

    ![speeddating](http://joedicastro.com/static/pictures/speeddating_en.gif "speeddating")

    > __Mappings__

    > - `<C-A>` Increase the time value under the cursor
    > - `<C-X>` Decrease the time value under the cursor
    > - `d<C-A>` Change the time under the cursor to the current UTC time
    > - `d<C-X>` Change the time under the cursor to the current Local time

- __delimitMate__ provides smart auto-completion for delimiters like
  __(), {}, [], "", '', ``__

    This is very easy to use. If we write the first pair of these chars, then
    the second one is automatically introduced and the cursor moves to the
    interior thereof. Then, we continue writing and to exit the inside you only
    have to write the second character or press `<S-Tab>`. If you only want the
    first char, you only have to press the __Delete__ key

    ![smartinput](http://joedicastro.com/static/pictures/smartinput_en.gif "smartinput")

- __neocomplete__ auto-completion of keywords, methods, functions, etc by only
  typing a few letters (normally the first). Well used, this speeds up a lot writing
  of code or text. It improves the Vanilla Vim auto-completion, with a live
  fuzzy-logic search. It's powerful and totally customizable.

    ![neocomp](http://joedicastro.com/static/pictures/neocomp_en.gif "neocomp")

    > __Mappings__

    > - `<CR>`    insert the selected word
    > - `<C-N>`   go to the next word (below) in the option list
    > - `<C-P>`   go to the previous word (above) in the option list

- __easydigraph__ easily insert digraphs, especially when trying to insert
  several simultaneously

    ![easydigraph](http://joedicastro.com/static/pictures/easydigraph_en.gif "easydigraph")
    >
    > __Mapping__
    >
    > - `<Leader>dd {motion}` turns in digraph the motion selected text

- __multiple cursors__ this allow us to edit the same visual selection in
  multiple locations at the same time. It's like a interactive search & replace

    ![multiple cursors](http://joedicastro.com/static/pictures/multiple_cursors_en.gif "multiple cursors")

    > __Mappings__

    > - `<C-N>` turn on the multiple cursors for the current word or visual
    >   selection. Press it again to find the next occurrence & move to it
    > - `<C-X>` skip the current position and move to the next one if it exists
    > - `<C-P>` deselect the current position and move back to the previous one
    > - `<ESC>` turn off the multiple cursors

- __vim-transpose__ transpose rows & columns. For certain kind of files, like
  *CSV*, it can be really helpful to deal with them. It works in visual mode.

    ![transpose](http://joedicastro.com/static/pictures/transpose_en.gif "transpose")

    > __Commands__

    > - `:Transpose` do the transposition by default
    > - `:TransposeCSV {separator} {delimiter}` do the transposition by `;` or by
    >   the specified separator & delimiter
    > - `:TransposeTab` transpose by tabs
    > - `:TransposeWords` transpose by words (inserts a `?` where is no one)
    > - `:TransposeInteractive` for complex transpositions


## Spell checking

![unite spell](http://joedicastro.com/static/pictures/unite_menu_spell_en.png "unite spell")

These menu entries are used for spell checking the text

__Unite__

- `<LocalLeader>s` or `:Unite menu:spelling` shows the spelling menu

## Regular expression searching (grep)

![unite grep](http://joedicastro.com/static/pictures/unite_menu_grep_en.png "unite grep")

This menu allows us to search files by regular expression engines. I have it
configured to use the `ag` program first, then `ack` if `ag` is not found, and
else the `grep` program. We can also use other Unix tools like `locate` and
`find` from this menu.

__Unite__

- `<LocalLeader>a` or `:Unite menu:grep` shows the grep menu

### Menu

- *grep (ag → ack → grep)* search files by content. Using a regular
  expression pattern in a target directory, shows us the results in Unite.
  Between brackets are the list of programs to use sorted by priority. It uses
  the first available.

- *find* use the known Unix tool `find` to search files by name

- *locate* same as above using the `locate` tool instead

- *vimgrep* as a last resort, in case you don't have any regex search tool
  installed, you can use the internal Vim grep one. But it is extremely low
  in comparison with another of the mentioned in the first entry. So, use it
  only if you are desperate.


## Searching inside the buffer

![unite searching](http://joedicastro.com/static/pictures/unite_menu_searching.png "unite searching")

__Unite__

- `<LocalLeader>f` or `:Unite menu:searching` shows the searching menu

### Menu

- *line* find all the lines where the introduced string appears

- *word under the cursor* find all the lines where the word under the cursor
  appears. It is a improved version of the `*` key behavior

- *outlines & tags (ctags)* list all the document "outlines" and allow us to
  navigate between them. Very useful to move around the headers of a Markdown
  document like this. In code files it shows the source tags (ctags) to move
  easily to a given point of the code.

- *marks* list all the marks

- *folds* navigate among folders

- *changes* list all the changes made to the file

- *jumps* list all the last window jumps

- *undos* show the file undo history

- *tasks* show all the pending tasks for the current buffer. These tasks (and notes)
  are defined by the following keywords: __TODO__, __FIXME__, __NOTE__, __XXX__
  , __COMBAK__, and __@todo__

### Other tools

- __vim-signature__ a plugin that improves the default Vim marks. It shows the
  marks in the lateral signs column.

    ![signature](http://joedicastro.com/static/pictures/signature_en.gif "signature")

    > __Mappings__

    > - Alphabetic marks

    >   - `m[a-zA-Z]` toggle the mark and display it in the signs column (gutter)
    >   -  `m,`       place the next available mark
    >   -  `m<Space>` delete all marks
    >   -  <code>]`</code>  jump the next mark
    >   -  <code>[`</code>  jmmp the previous mark
    >   -  `]'`       jump to start of next line containing a mark
    >   -  `['`       jump to start of previous line containing a mark

    > - Symbol marks (markers)

    >   -  `m[0-9]`       toggle the corresponding marker `!@#$%^&*()`
    >   -  `m<S-[0-9]>`   remove all markers of the same type
    >   -  `]-`           jump to next line having same marker
    >   -  `[-`           jump to prev line having same marker
    >   -  `m<BS>`        remove all markers


## Registers

![unite registers](http://joedicastro.com/static/pictures/unite_menu_registers.png "unite registers")

__Unite__

- `<LocalLeader>i` or `:Unite menu:registers` shows the registers menu

### Menu

- *yanks* list all the yanks arranged chronologically starting with the most
  recent

- *commands* show the Ex command history

- *searches* list the last searches

- *registers* show the vim registers content

- *messages* show the messages register (like the `:messages` command)

- *undo* launch the Gundo plugin. Gundo makes the Vim undo tree friendlier. We
  can preview the changes and navigate easily around the tree.

    ![gundo](http://joedicastro.com/static/pictures/gundo_en.gif "gundo")

## Files and directories

![unite files](http://joedicastro.com/static/pictures/unite_menu_files.png "unite files")

__Unite__

- `<LocalLeader>o` or `:Unite menu:archivos` show the file menu

### Menu

- *open file* show a list of files available in the current working directory

- *open more recently used files* show the last opened files

- *open file with recursive search* same as above but including the files under
  the subdirectories recursively

- the next three entries are similar to the preceding ones but working with
  directories instead of files

- *make new directory* make a new directory without opening a file browser

- *change working directory* allow us to change the current working directory

- *know current working directory* is like running the `:pwd` command

- *junk files* to open a new (or a previous one) junk file to make annotations,
  tests, ...

- *save as root* allow us to save a file that only have permissions for `root`
  without need to run Vim under that user (or use `$ sudo`) and lost our
  configuration advantages by doing that.

- *quick save* save quickly the file without need to run the `:w` command

- *open ranger* call the external ncurses file manager [Ranger][rngr] to browse
  the directory hierarchy and choose the file that you want to edit.

  [rngr]:http://joedicastro.com/productividad-linux-ranger.html

    ![ranger](http://joedicastro.com/static/pictures/ranger_vim_en.gif "ranger")

- *open vimfiler* open the file explorer Vimfiler, Unite based and very
  powerful. I used mainly in those computers where ranger is not available. It
  has a safe mode (enabled by default) in which you cannot copy, rename, move,
  create or delete files and directories.

    ![vimfiler](http://joedicastro.com/static/pictures/vimfiler_en.png "vimfiler")

    > __Mappings__

    > - `<Tab>` open a new vertical window, if is already opened toggle between them
    > - `j`, `k` and `gg` typical vim motions to move between the files
    > - `h`, `l` move between the parent and child directories
    > - `<Space>` select/deselect the current line
    > - `*` select/deselect all the lines
    > - `&` select similar lines
    > - `U` deselect everything
    > - `S` change the sort type (by name, date, size, ...)
    > - `c` copy the file (preceded by `C` do it to the clipboard)
    > - `m` move the file(preceded by `C` do it to the clipboard)
    > - `d` delete the file
    > - `r` rename the file
    > - `Cp` paste file from clipboard
    > - `K` new directory
    > - `N` new file
    > - `x` run the file's system associated program
    > - `e` edit the file
    > - `E` edit the file in a new window
    > - `v` preview the file
    > - `L` change the drive unit
    > - `~` go to the `home` directory
    > - <code>\\</code> go to the `root` directory
    > - `<C-J>` open the visited directories history (opened by <CR>)
    > - `<CR>` open a directory
    > - `<BS>` return to the parent directory
    > - `t` expand the directory tree
    > - `T` expand the directory tree recursively
     - `I` change to the directory entered in the command line
    > - `M` set the current mask (to filter files)
    > - `.` show/hide the hidden files (dotfiles)
    > - `q` hide vimfiler
    > - `Q` exit vimfiler
    > - `H` exit to the shell (exit from shell to return to vimfiler)
    > - `-` close the current vimfiler window
    > - `?` show the vimfiler help (mappings)
    > - `o` sync another vimfiler with this one
    > - `O` open a file/directory in another vimfiler
    > - `yy` yank the full path
    > - `gr` make grep into the current directory
    > - `gf` make find into the current directory
    > - `gc` make the current directory in the Vim working directory
    > - `a` choose the action to apply to the file
    > - `Y` save the current path in a temporal list
    > - `P` show the paths saved in the temporal list
    > - `<C-L>` redraw the screen
    > - `gs` toggle the safe mode __Warning!__
    > - `gS` toggle the simple mode

### Other tools

- __utl__ is a plugin to open URLs and files with an external tool from Vim

    ![utl](http://joedicastro.com/static/pictures/utl_en.gif "utl")

    > __Mapping__

    > `<Leader>j` if we use the mapping over a link, it will be opened into the
    > preconfigured application

## Code Edition

![unite code](http://joedicastro.com/static/pictures/unite_menu_code_en.png "unite code")

### Menu

- *run python code* run the current buffer python code via pymode. It shows the
  output in a new vertical window below

- *show docs for the current word* show the documentation available for the word
  under the cursor

- *insert a breakpoint* insert a breakpoint in python code. If we have `ipython`
  or `pudb` installed, it will use one of those instead the python `pdb`

- *pylint check* do a code revision by [pylint][pylint] by demand

  [pylint]: http://www.pylint.org/

- *run with python2 in tmux panel* use the Vimux plugin to interact with Tmux.
  It allows to send commands to a Tmux panel and interact with it without losing
  focus in Vim. If there are no other tmux panels opened, then a new panel is
  opened in the 20% lower space. In other case, the command runs in the already
  opened panel. This specific command run the buffer content with the `python2`
  executable in the tmux panel. In the next image we can see the actual
  behavior:

    ![vimux](http://joedicastro.com/static/pictures/vimux_en.gif "vimux")

- *run with python3 in tmux panel* same as above but using the `python3`
  interpreter

- *run with python2 & time in tmux panel* run the python code wrapped by the
  Unix `time` program to know the time consumed in the execution

- *run with pypy & time in tmux panel* same as above but using `pypy` instead of
  `python2`

- *command prompt to run in tmux panel* open a command line prompt to enter a
  custom command to run in a tmux panel

- *repeat last command* repeat the last vimux command

- *stop command execution in tmux panel* stop the execution of the last vimux
  command

- *inspect tmux panel* jump to the tmux panel where the last vimux command was
  executed and enter in the tmux *copy mode* allowing us to scroll around the
  panel and use the *vi mode* to copy text lines

- *close tmux panel* close the tmux panel opened or used by Vimux

- *rope auto-completion* allow us to use the rope auto-completion. Useful for
  methods auto-completion.

- *jump to definition* jump to the location where the word under the cursor
  (variable, function, class, method, ...) is defined. Open a new window with
  the location, even if it is in another module or library

- *reorganize imports* reorganize automatically the import statements

- *refactorize - x* the entries that begin in this way are for refactorize the
  python code with rope, using the method mentioned in each description

- *show docs for current word* use rope to show the available documentation
  about the word under the cursor. The advantage of this entry against the
  pymode one is that this one allow us to search in the external libraries
  documentation

- *syntastic toggle*,  *syntastic check & errors* are two options
  of Syntastic, a plugin for code quality (syntax revision) for various
  programming and markup languages (python, ruby, lua, haskell, css, html, js,
  json, ...) via external tools (these tools are required). Show the syntax
  errors in the signs column (gutter). Also shows the total of errors and the
  number line of the first in the status line

- *list virtualenvs* use the virtualenv plugin to list the python virtualenvs.

- *activate virtualenv* activate the virtualenv

- *deactivate virtualenv* deactivate the virtualenv

- *run coverage2* and *run coverage3* use the [coverage.py][cvg] tool for
  python2 and python3 respectively. It shows us the results in a window and as
  marks in the signs column (gutter) to know the code coverage of the current
  code.

  [cvg]: http://nedbatchelder.com/code/coverage/

- *toggle coverage report* and *toggle coverage marks* toggle the visibility of
  the marks and report from coverage

- *count lines of code* count the lines of code of the current file by the
  external program `$ cloc` and shows the output in Unite

- *toggle indent lines* show/hide the indent lines, that works as a visual guide
  for long nested blocks of code, putting vertical lines for each indentation
  level. Is disabled by default.

    ![indentLine](http://joedicastro.com/static/pictures/indentline_en.gif "indentLine")

### Other tools

- __Ultisnips__ is a plugin to manage snippets, the most advanced and powerful
  for this task that I know for Vim. Snippets are portions of code or text in
  which certain parts are declared as variable and the rest is fixed. They are
  very helpful to insert the same code structures again and again without need
  to write all the text, saving us an important number of keystrokes. To use
  them we only have to type the snippet keyword and the mapping, the fixed part
  of text is inserted automatically. Then the cursor moves to the first variable
  field to enter the desired text interactively, and so on. In the image you can
  see how it really works.

    Ultisnips brings by default a bunch of snippets classified for languages and
some globals. The best feature of Ultisnips is that allows us to define our
custom snippets with a level of control and automation than any other one
offers. To know all the details is essential to read carefully the plugin help.
BTW certain features are remarkable, like: nested snippets, embed external
commands (shell, vimscript and python) in the snippets, use the snippets over
visual selections, and text transformations into the snippets.

    I save my custom snippets in the `./Ultisnips` directory

    ![ulti](http://joedicastro.com/static/pictures/ulti_en.gif "ulti")

    > __Mappings__

    > - `<Tab>` preceded by the snippet keyword, trigger the snippet
    > - `<C-J>` jump to the next field
    > - `<C-K>` jump to the previous field
    > - `<BS>`  cancel the text enter in an optional field


## DVCS: Git

![unite git](http://joedicastro.com/static/pictures/unite_menu_git_en.png "unite git")

__Unite__

- `<localleader>g` or `:Unite menu:git` show the git menu

### Menu

- *tig* open the external application [tig][tig], which is a ncurses interface
  for git. Obviously, this only works when the working directory is into a git
  repository.

    ![tig](http://joedicastro.com/static/pictures/tig_en.gif "tig")

  [tig]: https://github.com/jonas/tig

- *git viewer* and *git viewer - buffer* use the __gitv__ plugin that is a clone
  of the `gitk` tool for Vim, which is the viewer provided originally by `git`.
  This plugin allows us to view the repository history, to do diffs, checkouts,
  merges, ... It works atop of Fugitive and requires of it for work, and both
  have a similar behavior. The first entry will open a viewer relative to the
  whole repository (explorer mode), while the second one will do it in function
  of the current buffer or a visual selection (file mode)

    ![gitv](http://joedicastro.com/static/pictures/gitv_en.png "gitv")

    > __Mappings__

    > - `<CR>` open a commit, a diff, a tree, a file, more commits, etc,
    >   depending of where is used, with a similar behavior that Fugitive

    > - `o` open the commit in a new horizontal window

    > - `O` open the commit in a new tab

    > - `s` open the commit in a new vertical window

    > - `i` in "explorer mode" open the file & in "file mode" open the commit
    >   details

    > - `q` exit from gitv

    > - `a` toggle the `-all` argument and update the window

    > - `u` update the window content

    > - `co` do a `git checkout`. In "explorer mode" dot it over the whole
    >   repository and in the "file mode" do it over the current file

    > - `D` do a diff via vimdiff.

    > - `S` show a `diffstat`

    > - `m` and `<Leader>m` do a merge in visual and normal modes respectively

    > - `git` enter the `:Git ` command in the command line to enter a custom
    >   git command. If the command changes the repository status, the changes
    >   will be updated in gitv

    > - `yc` yank the commit short hash, `sha`

    > __Motions__

    > - `x` and `X` to move around the branch points (where a merge is created)

    > - `r` and `R` to move around the references

    > - `P` jump to the commit tagged as `HEAD`


- Almost of the rest of the entries are typical git commands which are executed
  via the __Fugitive__ tool. Fugitive is a git wrapper, so good that allows us
  to manage git repositories without leave Vim. It's so complete and powerful
  that requires a certain amount of time to get used to it and get total control
  over its particular interface. The author, Tim Pope, says that about it: "A
  Git wrapper so awesome, it should be illegal" and is almost true.

      ![fugitive](http://joedicastro.com/static/pictures/fugitive_en.png "fugitive")

    - *status* show the repository status and from this window we can access to
      multiple options. In this window this mappings are available:

        > __Mappings__

        > - `<C-N>` and `<C-P>` allow us to move between files

        > - `<CR>` run the `:Gedit` command that allow us to "edit" a revision

        > - `-` using it over a file that is not included in the 'stage area'
        >   (index) it add it, is like run a `git add` or `git stage` in the
        >   shell.  Using it over a file included in the `stage area`, remove it
        >   from there, like using a `git reset`

        > - `cc` or `C` do a commit with the command `:Gcommit` the same as
        >   doing a `git commit`

        > - `ca` do a commit which add the new changes to the previous commit,
        >   useful when we forgot add something in a commit. Same as `git commit
        >   --amend`

        > - `D` make a diff between the current version and the index one, using
        >   vimfiler via the `:Gdiff` command

        > - `ds` do a diff with `:Gsdiff`, same as above but split windows
        >   horizontally

        > - `dv` do a diff without `:Gvdiff`, with vertical split windows. A
        >   synonym of `D`

        > - `dp` has a dual behavior. On the one hand, if there are changes but
        >   those are not in the `stage area` (index), then show a diff with the
        >   changes, like running the `git diff` command. Then, if we make a
        >   `:Gwrite` (`<Leader>gw`) the changes are added to the index and we
        >   can submit a commit now. On the other hand, if there are files that
        >   are not being tracked, try to add them using the `git add
        >   --intent-to-add .` command

        > - `p` to submit partial commits, where we choose interactively which
        >   changes portions are included in the index and which not. If we use
        >   it over a file that is not in the index, we will we asked about what
        >   parts we want to index, like running `git add --patch`. If we use it
        >   with an already indexed file, we'll choose what parts remove from
        >   the index, same as `git reset --patch`

        > - `o` open the file in a new horizontal window

        > - `O` open the file in a new tab

        > - `S` open the file in a new vertical window

        > - `R` update the status window

        > - `q` close the status window

    - *diff* make a diff (`:Gdiff`) between the current version of the file versus
      the one in the index. In conflict situations like in a merge, it will we a
      three-way diff, which makes it a good tool for dealing with `merge` and
      `rebase`. The mapping available for this window are the following (to know how
      vimdiff works, look up the help):

        > __Mappings__

        > - `do` do a `:diffget`, get the changes from the other file
        > - `dp` do a `:diffput`, put the changes to the other file
        > - `<Leader>du` do a  `:diffupdate`, update changes
        > - `<Leader>dq` exit from diffmode
        > - `u` undoes all changes
        > - `[c` and `]c` to move between diffs
        > - `:Gwrite` or `<Leader>gw` write the changes to the index

    - *commit* use the `:Gcommit` command (same as `git commit`). If there is
      nothing in the index, then do a `:Gstatus` and show the status window.
      __Warning__: Unlike when running the actual git-commit command, it is
      possible (but unadvisable) to muck with the index with commands like
      git-add and git-reset while a commit message is pending

    - *log* show all the previous revisions of the current file in a Unite
      window, starting for the most recent and open the last in the current
      buffer. To return to the current file, use `:Gedit` (`<Leader>ge`). Within
      the buffer we can move between revision using the commands `:cnext`,
      `:cprevious`, `:cfirst` and `:clast`

    - *log - all* similar as the previous one, but in this case all the
      repository commits are showed, and what appears in the buffer is something
      similar to the `git show` command output

    - *blame* use the `:Gblame` command that opens a new vertical widow at the
      left of the current buffer, where is displayed the commit, the author and
      date for each line of the file. Similar to run `git blame`.

        > __Mappings__

        > - `A` resize the blame window to end of author column
        > - `C` resize the blame window to end of commit column
        > - `D` resize the blame window to end of date column
        > - `q` close the blame window
        > - `gq` close the blame window and runs `:Gedit` to restore the current
        >   version
        > - `<CR>` close the blame window and open the selected commit
        > - `o` open the selected commit in a new horizontal window
        > - `O` open the selected commit in a new tab
        > - `-` runs a new `blame` in the selected commit

    - *add/stage* use the `:Gwrite` command that save the actual file and adds
      it to the index with the changes made. Is like doing a `git add` or its
      synonym `git stage`

    - *checkout* do a `:Gread`, empty the current buffer and restore the index
      copy or what is the same, like if we were making a `git checkout` to the
      file. The changes are not permanent until we save the file.

    - *rm* remove the file with the `:Gremove` command and empty the buffer. We
      get the same as if we do a `git rm` in the shell

    - *mv* as for a new path and move the file there, renaming automatically the
      buffer. The similar git command would be `git mv`. The target is relative to
      the current path, unless is preceded by `/` in which case is relative to the
      repository root

    - *push* execute the `:Git! push` command, showing the output in the buffer

    - *pull* do a `:Git! pull` redirecting the output to the buffer

    - *command* run the git command that we entered in the command line and show
      the result in a new buffer (exit from there by pressing `q`). We can use
      the current custom alias in our git config. This option by itself is
      reason enough to use Fugitive.

    - *edit* allow us to "edit" any git object (blobs, trees, commits, tags). It
      supports auto-completion and we can use a SHA, a branch, a tag, a tree or a
      commit.

    - *grep* do a grep over the repository using `:Ggrep` which in turn use `git
      grep`

    - *grep (messages)* make a grep over the repository using `:Glog --grep=` to
      search into the commit messages

    - *grep (text)* make a grep over the repository using `:Glog -S` to search
      into the commits where the text had been added or removed

    - *init* create a new git repository or reset a previous one (safe)

    - *cd* change the working directory to the repository one

    - *lcd* change the current buffer's working directory to the repository one

    - *browse* if the remote repository is at GitHub open it in a browser,
      showing the git object that  we have selected in that moment. Otherwise,
      use `git instaweb` to display the current selected blob, tree, commit or
      tag.  If a range is given, it is appropriately appended to the URL as an
      anchor

    Fugitive is a very powerful plugin that you only can learn how to use it by
    using it. And is very advisable to read the help to get a global vision of
    it.

- *github dashboard* and *github activity* are two options to browse events at
  GitHub. With the first one we can browse the GitHub Dashboard of a given user.
  The last one allow us to view the public activity of a given user or repository.
  There is a limit of 60 calls/hour on the GitHub API without authentication.

    ![gh dashboard](http://joedicastro.com/static/pictures/gh_dashboard.png "gh dashboard")

    > __Mappings__

    > - `<Tab>` & `<S-Tab>` to navigate back and forth through the links
    > - `<Enter>` open a link in the browser
    > - R refresh the window
    > - q close the window

- *github issues & PR* open the external ncurses application [shipit][shpt]
  that is an interface for GitHub issues and pull requests. The application is
  still in development but is an amazing way to manage GitHub issues without
  leaving Vim and the terminal. If you are inside a git repository that have a
  remote in GitHub, it will open the app for that repository.

    ![shipit](http://joedicastro.com/static/pictures/shipit.png "shipit")

  [shpt]: https://github.com/alejandrogomez/shipit



### Other tools

- *vim-gitgutter* show the changes that are made in the buffer versus the git
  repository index. It makes a `git diff` and shows the status
  (changed/added/deleted) of each line in the gutter (signs column).


## Web Development

__HTML5__

Provides autocompletion, syntax and indentation for HTML5. For that purpose
supports SVG, RDFa, microdata and WAI-AIRA


__Emmet__

![emmet](http://joedicastro.com/static/pictures/emmet.gif "emmet")

Emmet (former Zen Coding) allow us to write HTML/XML and CSS files more fast and
in a more brief and less tedious way. Emmet takes the snippets idea to a whole
new level: you can type CSS-like expressions that can be dynamically parsed, and
produce output depending on what you type in the abbreviation.

The best way to know how this works is to look at the tutorial (`:h
emmet-tutorial` <vimhelp:emmet-tutorial>) or read the official documentation,
[Emmet docs](http://docs.emmet.io/)

> __Mappings__

> - `<C-Y>,` expand abbreviation (works as a wraper in visual mode, see the help)
> - `<C-Y>d` select the tag inward
> - `<C-Y>D` select the tag outward
> - `<C-Y>n` go to the next edit point
> - `<C-Y>N` go to the previous edit point
> - `<C-Y>i` update image size
> - `<C-Y>k` remove tag
> - `<C-Y>j` split/join tag
> - `<C-Y>/` toggle comment
> - `<C-Y>a` make anchor from url
> - `<C-Y>A` make quoted text from url
> - `<C-Y>c` code pretty


## Color Management

![unite colorv](http://joedicastro.com/static/pictures/unite_menu_colorv_en.png "unite colorv")

ColorV is the perfect plugin to deal with Color Management under Vim. And is
ideal for edit CSS files and preview the colors that match with his definition.
Also have a lot of tools for pick a color, choose/create a color scheme, deal
with different color spaces, ... It has virtually everything you could need for
color management, without envy too many professional tools

__Unite__

`<LocalLeader>c` or `:Unite menu:colorv` shows the *ColorV* menu

![colorv](http://joedicastro.com/static/pictures/colorv_en.gif "ColorV")

### Menu

- *open colorv* show the ColorV window

- *open colorv with the color under the cursor* show the ColorV window with the
  color under the cursor selected

- *preview colors* is very useful for CSS sheets, where shows the color codes
  highlighted with its matching color

- *color picker* open a graphical color picker

- *edit the color under the cursor* open ColorV window with the color under the
  cursor and when we close it, put the edited color in the buffer

- the next entry is similar as above, but in this case change all the buffer
  colors similar to the selected one (previous confirmation)

- *insert a color* insert a color using the ColorV window. In the mapping the
  second `i` can be replaced for a `r` to insert a RGB color or a `m` for a CMYK
  one, etcetera (look at the help for more information)

- *color list relative to the current* show a side window with a color list with
  the same hue that the one under the cursor. The `h` in the mapping can
  replaced by a `s` to show a color list by saturation, `a` for analogues, and
  so on (consult the help for more info)

- *show color list (Web W3C colors)* show a side window with a colors list by
  name (Web W3C colors)

- *choose color scheme (ColourLovers, Kuler)* allow us to choose a color scheme
  from [Kuler](https://kuler.adobe.com) o
  [ColourLovers](http://www.colourlovers.com/)

- *show favoire color schemes* show the color schemes marked as favorites
  (`f` to mark it, `F` to unmark it)

- *new color scheme* create a new color scheme

- *create hue gradation between two colors* crate a color gradation based in a
  parameter (hue, saturation, ...)

    > __Mappings in the ColorV window__

    > - `z/Z` resize the window
    > - `?` show the mappings ciclically
    > - `q` close the window


## Markdown

![unite markdown](http://joedicastro.com/static/pictures/unite_menu_markdown_en.png "unite markdown")

This allows us to preview the rendering of a Markdown file in the browser,
it supports the Markdown `extra` extension. The file is rendered by
Python-markdown, creating a temporal html file and open it in a browser tab.

Used in conjunction with a plugin that refresh the browser tab when the html file
changes, we get a way to preview your document changes without leaving vim .

__Unite__

- `<localleader>k` or`:Unite menu:markdown` shows the markdown menu

### Menu

- *preview* renders the Markdown document in a temporal html file and open it in
  a new browser tab

- *refresh* rewrites the html file with the changes

    ![mep]( http://joedicastro.com/static/pictures/mep_en.gif "mep")

## Linux/Unix tools

__DirDiff__

It has a similar behavior that the vimdiff tool but for directories instead
of individual files

![DirDiff](http://joedicastro.com/static/pictures/dirdiff_en.gif "DirDiff")

> __Commands__

> - `:DirDiff {A:directory 1} {B: directory 2}` shows the differences between
>   the two directories
> - `:DirDiffQuit` exit from DirDiff mode


__Hexadecimal Editor__

For this I use the Vinarise plugin, a well thought hexadecimal editor for Vim.

No play with this, is not a toy, this is for grown ups only! If you do not know
what you are doing, keep your hands out of it! :smile: If you are all thumbs,
this tool is a sure candidate for a disaster.

![hex](http://joedicastro.com/static/pictures/vinarise_en.png "hex")

> __Mappings__

- `<F6>` entry into the Hexadecimal mode
- `V`  edit the file in ASCII mode with Vim (Vinarise keeps opened)
- `q`  hide Vinarise
- `Q`  quit Vinarise
- `<C-G>` show current position
- `r`  change current address
- `R`  overwrite from current address
- `gG` move to input address
- `go` move by offset address
- `/`  search binary value
- `?`  search binary value reverse
- `g/` search string value
- `g?` search string value reverse
- `e/` search regular expression (search only forward)
- `E`  change encoding
- `<C-L>` redraw
- `g<C-L>` reload

## Internationalization

__Translate .po files__

Is a tool to add syntax highlighting to `.po` files (GNU gettext) and some
mappings to edit them easily.

![po](http://joedicastro.com/static/pictures/po_en.gif "po")

> __Mappings__

> - `/u` move to the next untranslated string
> - `/U` move to the previous untranslated string
> - `/c` copy the `msgid` string to `msgstr`
> - `/C` create a comment for that entry
> - `/d` delete the `msgstr` string (Insert mode only)
> - `/f` move to the next "fuzzy" string
> - `/F` move to the previous "fuzzy" string
> - `/z` tag the entry as "fuzzy"
> - `/Z` delete the "fuzzy" tag
> - `/s` show the `msgfmt` statistics from the file
> - `/e` move along the `msgfmt` errors from the file
> - `/t` entry the translator info in the header
> - `/T` entry the translator team info in the header
> - `/W` formats the entire file
> - `gf` open in a new window the file under the cursor


## Vim tools

![unite vim](http://joedicastro.com/static/pictures/unite_menu_vim_en.png "unite vim")

Several Vim tools grouped under this menu among others that not fitted well in
any other menu.

__Unite__

- `<LocalLeader>v` or `:Unite menu:vim` shows this menu

### Menu

The first entry is already commented at the beginning of this document

- *mappings*  shows all the customized mappings available whit their
  corresponding associated action. Those ones that corresponds with plugins that
  are Lazy are not showed unless the plugin is already loaded.

- *edit configuration file (vimrc)* edits the vim configuration file `~./.vimrc`

- *choose filetype* choose a filetype from a list to apply to the current buffer

- *vim help* search into the vim help (slow)

- *vim commands* list all commands available as candidates. For Lazy plugins,
  these need to be loaded before appears in the list.

- *vim functions* same as above for functions instead of commands

- *vim runtimepath* shows all paths in the vim runtimepath

- *vim command output* shows the output of a Vim command through the Unite
  interface (e.g. `:ls`)

- *unite sources* all the Unite sources available

- *kill process* shows the output of the Unix command `top` where we can select
  one or more process to kill them with `kill`

- *launch executable* launch an executable from a list, in a similar behavior as
  `dmenu`

## Prerequisites

__Vim__

To have a completely functional version of Vim with this configuration, you need
a Vim version greater or equal than __7.3__ and compiled with support for
Python, Lua and Ruby. You can know that using the `:version` command, it shows
the Vim version and the supported features (those one preceded by a plus symbol
`+`)

You can compile Vim from source if your distribution does not offer a package
that fits those requirements. You only have to configure it with the adequate
parameters, something like this:

    $ hg clone https://code.google.com/p/vim/ vim
    $ cd vim
    $ ./configure --with-features=huge \
                  --enable-gui=gnome2 \
                  --enable-luainterp=yes \
                  --enable-pythoninterp=yes \
                  --enable-rubyinterp=yes \
                  --enable-perlinterp=yes \
                  --enable-cscope
    $ make
    $ sudo make install

__Programs__

You need also several programs to enjoy a complete experience:

- __[ctags][ctags]__, to generate the tags for code files, usually distributed
  as `exuberant-ctags`
- __[ag][ag]__, __[ack][ack]__ or __[grep][grep]__ for regex searches of files
- __[git][git]__ for git repositories administration

__Optional programs__

If you want to use the same external auxiliary programs that I use for this
config, those are the needed:

- __[tig][tig]__ is a ncurses git manager

- __[coverage][cvg]__ analyze the coverage for a Python program

- __[ranger][rngr]__ an amazing ncurses file explorer. My personal configuration
  is also in this same repository in the `../ranger` folder

- __[pylint][pylint]__ code quality tool for Python

- __[virtualenvwrapper][venvwppr]__ to manage Python virtualenvs easily

  [venvwppr]: http://virtualenvwrapper.readthedocs.org/en/latest/

__Font__

The __Dejavu Sans for Powerline__ font is required for the vim-airline plugin.
It can be founded in this same repository under the `../fonts` folder. You can
find more fonts ready for powerline in this repository, [powerline
fonts][pwrfnts]

  [ctags]: http://ctags.sourceforge.net/
  [ag]: https://github.com/ggreer/the_silver_searcher
  [ack]: http://beyondgrep.com/
  [grep]:http://www.gnu.org/software/grep/
  [git]: http://git-scm.com/
  [pwrfnts]: https://github.com/Lokaltog/powerline-fonts

## Alternative settings

Maybe this setup can be helpful to you and decide to clone/fork it, but you
don't like all the settings. Well, in this case you still can clone this config
and customize it as you want without loose the evolution of mine.

To do this I added the possibility to read an additional file to load your
custom settings. This file is located by default in this path
`~/.vim/custom.vim`. Those settings override the similar ones in the .vimrc file

__Example__

I like the folding setting by default in python files, but if you do not like
it, you can add this line to that file:

```VimL
let g:pymode_folding = 0
```

At the same time I have all the folds closed by default, if you prefer open the
file with all the folds opened, you can add this other line (currently is the
default):

```VimL
au FileType python setlocal foldlevel=1000
```


## Plugins & Colorschemes

- __badwolf__  <https://github.com/sjl/badwolf>
- __colorv.vim__ <https://github.com/Rykka/colorv.vim>
- __coveragepy.vim__ <https://github.com/alfredodeza/coveragepy.vim>
- __crontab.vim__ <https://github.com/vim-scripts/crontab.vim>
- __csapprox__ <https://github.com/godlygeek/csapprox>
- __delimitMate__ <https://github.com/Raimondi/delimitMate>
- __DirDiff.vim__ <http://github.com/joedicastro/DirDiff.vim>
- __easydigraph.vim__ <https://github.com/Rykka/easydigraph.vim>
- __emmet-vim__ <https://github.com/mattn/emmet-vim>
- __gitv__ <https://github.com/gregsexton/gitv>
- __gundo.vim__ <https://github.com/sjl/gundo.vim>
- __harlequin__ <https://github.com/nielsmadan/harlequin>
- __html5.vim__ <https://github.com/othree/html5.vim>
- __indentLine__ <https://github.com/Yggdroot/indentLine>
- __JSON.vim__ <https://github.com/vim-scripts/JSON.vim>
- __junkfile.vim__ <https://github.com/Shougo/junkfile.vim>
- __loremipsum__ <https://github.com/vim-scripts/loremipsum>
- __molokai__ <https://github.com/tomasr/molokai>
- __neobundle.vim__ <https://github.com/Shougo/neobundle.vim>
- __neocomplete.vim__ <https://github.com/Shougo/neocomplete.vim>
- __po.vim--gray__ <https://github.com/vim-scripts/po.vim--gray>
- __python-mode__ <https://github.com/klen/python-mode>
- __summerfruit256.vim__ <https://github.com/vim-scripts/summerfruit256.vim>
- __syntastic__ <https://github.com/scrooloose/syntastic>
- __ultisnips__ <https://github.com/SirVer/ultisnips>
- __unite-colorscheme__ <https://github.com/ujihisa/unite-colorscheme>
- __unite-filetype__ <https://github.com/osyo-manga/unite-filetype>
- __unite-fold__ <https://github.com/osyo-manga/unite-fold>
- __unite-help__ <https://github.com/tsukkee/unite-help?>
- __unite-locate__ <https://github.com/ujihisa/unite-locate>
- __unite-mark__ <https://github.com/tacroe/unite-mark>
- __unite-outline__ <https://github.com/Shougo/unite-outline>
- __unite-quickfix__ <https://github.com/osyo-manga/unite-quickfix>
- __unite.vim__ <https://github.com/Shougo/unite.vim>
- __utl.vim__ <https://github.com/vim-scripts/utl.vim>
- __vim-airline__ <https://github.com/bling/vim-airline>
- __vim-characterize__ <https://github.com/tpope/vim-characterize>
- __vim-commentary__ <https://github.com/tpope/vim-commentary>
- __vim-fugitive__ <https://github.com/tpope/vim-fugitive>
- __vim-gitgutter__ <https://github.com/airblade/vim-gitgutter>
- __vim-github256__ <https://github.com/joedicastro/vim-github256>
- __vim-github-dashboard__ <https://github.com/junegunn/vim-github-dashboard>
- __vim-markdown__ <https://github.com/joedicastro/vim-markdown>
- __vim-markdown-extra-preview__ <https://github.com/joedicastro/vim-markdown-extra-preview>
- __vim-molokai256__  <https://github.com/joedicastro/vim-molokai256>
- __vim-multiple-cursors__ <https://github.com/terryma/vim-multiple-cursors>
- __vim-pentadactyl__ <https://github.com/joedicastro/vim-pentadactyl>
- __vim-repeat__ <https://github.com/tpope/vim-repeat>
- __vim-signature__ <https://github.com/kshenoy/vim-signature>
- __vim-speeddating__ <https://github.com/tpope/vim-speeddating>
- __vim-surround__ <https://github.com/tpope/vim-surround>
- __vim-textobj-entire__ <https://github.com/kana/vim-textobj-entire>
- __vim-textobj-indent__ <https://github.com/kana/vim-textobj-indent>
- __vim-textobj-lastpat__ <https://github.com/kana/vim-textobj-lastpat>
- __vim-textobj-line__ <https://github.com/kana/vim-textobj-line>
- __vim-textobj-underscore__ <https://github.com/kana/vim-textobj-underscore>
- __vim-textobj-user__ <https://github.com/kana/vim-textobj-user>
- __vim-tmux__ <https://github.com/vimez/vim-tmux>
- __vim-transpose__ <https://github.com/salsifis/vim-transpose>
- __vim-unite-history__ <https://github.com/thinca/vim-unite-history>
- __vim-virtualenv__ <https://github.com/jmcantrell/vim-virtualenv>
- __vimfiler__ <https://github.com/Shougo/vimfiler.vim>
- __vimproc__ <https://github.com/Shougo/vimproc.vim>
- __vimux__ <https://github.com/benmills/vimux>
- __vinarise.vim__ <https://github.com/Shougo/vinarise.vim>
- __webapi-vim__ <https://github.com/mattn/webapi-vim>
- __winresizer__ <https://github.com/jimsei/winresizer>
- __zoomwintab.vim__ <https://github.com/vim-scripts/zoomwintab.vim>


