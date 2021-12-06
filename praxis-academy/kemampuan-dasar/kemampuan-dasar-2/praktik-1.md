### Create a folder for your project.
```
D:\>mkdir rhymes
D:\>cd rhymes
```

### To make this directory and empty Git repo do this:
```
D:\rhymes>git init
Initialized empty Git repository in D:/rhymes/.git/
```

### I usually create an empty README.txt file for the first commit in my project
### history.
```
D:\rhymes>type NUL > README.txt
D:\rhymes>git add README.txt
D:\rhymes>git commit -m "First commit."
[master (root-commit) 2b6165d] First commit.
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 README.txt
```
 
### Add some explanation about the project to the README file.
```
D:\rhymes>echo 'This repo is a collection of my favorite nursery rhymes.' >> README.txt
```

### Review uncommitted changes. Then commit them.
```
D:\rhymes>git status
On branch master
Changes not staged for commit:
 (use "git add <file>..." to update what will be committed)
 (use "git restore <file>..." to discard changes in working directory)
       <span style="color:red">modified:   README.txt</span>
no changes added to commit (use "git add" and/or "git commit -a")	  
D:\rhymes>git diff
diff --git a/README.txt b/README.txt
index e69de29..28264bd 100644
--- a/README.txt
+++ b/README.txt
<span style="color:blue">@@ -0,0 +1 @@</span>
<span style="color:green">+'This repo is a collection of my favorite nursery rhymes.'</span>
D:\rhymes>git add README.txt
D:\rhymes>git commit -m "Added project overview to README.txt"
[master a077c1f] Added project overview to README.txt
 1 file changed, 1 insertion(+)
```

### Alice downloads favorite rhymes.
```
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/all-around-the-mulberry-bush.txt
--2019-11-09 02:56:06--  https://www.acquia.com/sites/default/files/blog/all-around-the-mulberry-bush.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.118.45, 104.16.117.45
Connecting to www.acquia.com (www.acquia.com)|104.16.118.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 02:56:07 ERROR 404: Not Found.
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/jack-and-jill.txt
--2019-11-09 02:59:35--  https://www.acquia.com/sites/default/files/blog/jack-and-jill.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.118.45, 104.16.117.45
Connecting to www.acquia.com (www.acquia.com)|104.16.118.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 02:59:37 ERROR 404: Not Found.
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/old-mother-hubbard.txt
--2019-11-09 02:59:44--  https://www.acquia.com/sites/default/files/blog/old-mother-hubbard.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.118.45, 104.16.117.45
Connecting to www.acquia.com (www.acquia.com)|104.16.118.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 02:59:45 ERROR 404: Not Found.
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/twinkle-twinkle.txt
--2019-11-09 03:00:41--  https://www.acquia.com/sites/default/files/blog/twinkle-twinkle.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.118.45, 104.16.117.45
Connecting to www.acquia.com (www.acquia.com)|104.16.118.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 03:00:43 ERROR 404: Not Found.
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/hokey-pokey.txt
--2019-11-09 03:01:15--  https://www.acquia.com/sites/default/files/blog/hokey-pokey.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.117.45, 104.16.118.45
Connecting to www.acquia.com (www.acquia.com)|104.16.117.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 03:01:16 ERROR 404: Not Found.
```

### The files have been downloaded, but not committed.
### You can see this with git status. git status
### Alice adds the files one-by-one to make her git history look nice and tidy.
```
D:\rhymes>git add all-around-the-mulberry-bush.txt
D:\rhymes>git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        <span style="color:green">new file:   all-around-the-mulberry-bush.txt</span>
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        <span style="color:red">hokey-pokey.txt</span>
        <span style="color:red">jack-and-jill.txt</span>
        <span style="color:red">old-mother-hubbard.txt</span>
        <span style="color:red">twinkle-twinkle.txt</span>
D:\rhymes>git commit -m "Added all-around-the-mulberry-bush.txt."
[detached HEAD d4a9e08] Added all-around-the-mulberry-bush.txt.
 1 file changed, 12 insertions(+)
 create mode 100644 all-around-the-mulberry-bush.txt
D:\rhymes>git add jack-and-jill.txt
D:\rhymes>git commit -m "Added jack-and-jill.txt."
[detached HEAD 8d28c49] Added jack-and-jill.txt.
 1 file changed, 12 insertions(+)
 create mode 100644 jack-and-jill.txt
```

### Alice gets lazy and decides to just add everything else at once.
```
D:\rhymes>git add .
D:\rhymes>git commit -m "Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt"
[detached HEAD 663e6ac] Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
 3 files changed, 114 insertions(+)
 create mode 100644 hokey-pokey.txt
 create mode 100644 old-mother-hubbard.txt
 create mode 100644 twinkle-twinkle.txt
```

### Alice reviews and admires her commit history.
```
D:\rhymes>git log
commit 663e6acfffb0c494c21c7e5b1ce44560f1d16bec (HEAD)
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:31:07 2019 +0700
    Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
commit 8d28c49f32336fda6b19d229eaea6192b96270fe
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:29:48 2019 +0700
    Added jack-and-jill.txt.
commit d4a9e0860a8cf52fd4a36e9b3914677ef320e7f0
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:29:13 2019 +0700
    Added all-around-the-mulberry-bush.txt.
commit 085dd16a56c23fe2e0e2641d39e1499e2b0f24bc
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:25:53 2019 +0700
    back
commit 83047232b3c41babbfa0a0bb479493a740e4a7f7 (master)
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:15:13 2019 +0700
    Added jack-and-jill.txt.
commit a077c1f17711d1058de0318a656e675bb7953596
Author: fourthten <agung0410@gmail.com>
Date:   Fri Nov 8 14:00:59 2019 +0700
    Added project overview to README.txt
commit 2b6165dbebc05813414f7acb768348108e497c2c
Author: fourthten <agung0410@gmail.com>
Date:   Fri Nov 8 13:58:52 2019 +0700
    First commit.
(END)
D:\rhymes>git log --oneline
663e6ac (HEAD) Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
8d28c49 Added jack-and-jill.txt.
d4a9e08 Added all-around-the-mulberry-bush.txt.
085dd16 back
8304723 (master) Added jack-and-jill.txt.
a077c1f Added project overview to README.txt
2b6165d First commit.
D:\rhymes>git log -p
commit 663e6acfffb0c494c21c7e5b1ce44560f1d16bec (HEAD)
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:31:07 2019 +0700
Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
diff --git a/hokey-pokey.txt b/hokey-pokey.txt
new file mode 100644
index 0000000..4f05910
--- /dev/null
+++ b/hokey-pokey.txt
@@ -0,0 +1,58 @@
+Everybody form a circle
+Put your left foot in
+Your left foot out
+Your left foot in
+And shake it all about
+You do the hokey pokey
+And turn yourself around
+Now put your right foot in
+Your right foot out
+Right foot in
+Then you shake it all about
+And then you do the hokey pokey
+Turn yourself around
+That's what it's all about
+You put your head in
+You put your head out
+Put your head in
+And bang it all about
+Do the hokey pokey
+And turn yourself around
+That's what it's all about
+Let's do the hokey pokey!
+Let's do the hokey pokey!
+Let's do the hokey pokey!
+That's what it's all about
+Put your right hand in
+Your right hand out
+Your right hand in
+And shake it all about
+You do the hokey pokey
+And you turn yourself around
+Now put your tongue in
+And your tongue out
+Tongue in
+And blblblblbl!
+You do the hokey pokey
+Turn yourself around
+That's what it's all about
+You put your bottom in
+Put your bottom out
+Put your bottom in
+You put your bottom out
+Put your bottom in
+You put your bottom out
+Put your bottom in
+You put your bottom out
+Put your bottom in
+You put your bottom out
+Put your bottom in
+You put your bottom out
+Put your bottom in
+You put your bottom out
+Do the hokey pokey
+Turn yourself about
+Let's do the hokey pokey
+Let's do the hokey pokey
+Let's do the hokey pokey
+That's what it's all about
\ No newline at end of file
diff --git a/old-mother-hubbard.txt b/old-mother-hubbard.txt
new file mode 100644
index 0000000..6c9c483
--- /dev/null
+++ b/old-mother-hubbard.txt
@@ -0,0 +1,43 @@
+Old Mother Hubbard
+Went to the cupboard,
+To give the poor dog a bone:
+When she came there,
+The cupboard was bare,
+And so the poor dog had none.
+
+She went to the baker's
+To buy him some bread;
+When she came back
+The dog was dead!
+
+She went to the undertaker's
+To buy him a coffin;
+When she came back
+The dog was laughing.
+
+She took a clean dish
+to get him some tripe;
+When she came back
+He was smoking his pipe.
+
+She went to the alehouse
+To get him some beer;
+When she came back
+The dog sat in a chair.
+
+She went to the tavern
+For white wine and red;
+When she came back
+The dog stood on his head.
+
+She went to the fruiterer's
+To buy him some fruit;
+When she came back
+He was playing the flute.
+
+She went to the tailor's
+To buy him a coat;
+When she came back
+He was riding a goat.
+
+She went to the hatter's...
\ No newline at end of file
diff --git a/twinkle-twinkle.txt b/twinkle-twinkle.txt
new file mode 100644
index 0000000..1405cf3
--- /dev/null
+++ b/twinkle-twinkle.txt
@@ -0,0 +1,13 @@
+Twinkle, twinkle, little star
+How I wonder what you are
+Up above the world so high
+Like a diamond in the sky
+Twinkle, twinkle little star
+How I wonder what you are
+
+When the blazing sun is gone
+When he nothing shines upon
+Then you show your little light
+Twinkle, twinkle, all the night
+Twinkle, twinkle, little star
+How I wonder what you are
\ No newline at end of file
commit 8d28c49f32336fda6b19d229eaea6192b96270fe
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:29:48 2019 +0700
Added jack-and-jill.txt.
diff --git a/jack-and-jill.txt b/jack-and-jill.txt
new file mode 100644
index 0000000..7a064b4
--- /dev/null
+++ b/jack-and-jill.txt
@@ -0,0 +1,12 @@
+Jack and Jill went up the hill
+To fetch a pail of water
+Jack fell down and broke his crown
+And Jill came tumbling after
+Jack got up, and home did trot
+As fast as he could caper
+To old Dame Dob, who patched his nob
+With vinegar and brown paper
+Jack and Jill went up the hill
+To fetch a pail of water
+Jack fell down and broke his crown
+And Jill came tumbling after
\ No newline at end of file
commit d4a9e0860a8cf52fd4a36e9b3914677ef320e7f0
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:29:13 2019 +0700
Added all-around-the-mulberry-bush.txt.
diff --git a/all-around-the-mulberry-bush.txt b/all-around-the-mulberry-bush.txt
new file mode 100644
index 0000000..2d62447
--- /dev/null
+++ b/all-around-the-mulberry-bush.txt
@@ -0,0 +1,12 @@
+All around the mulberry bush
+The monkey chased the weasel
+The monkey thought 'twas all in fun
+Pop! goes the weasel
+A penny for a spool of thread
+A penny for a needle
+That's the way the money goes
+Pop! goes the weasel
+Half a pound of tuppenny rice
+Half a pound of treacle
+Mix it up and make it nice
+Pop! goes the weasel
\ No newline at end of file
commit 085dd16a56c23fe2e0e2641d39e1499e2b0f24bc
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:25:53 2019 +0700
back
diff --git a/all-around-the-mulberry-bush.txt b/all-around-the-mulberry-bush.txt
deleted file mode 100644
index 2d62447..0000000
--- a/all-around-the-mulberry-bush.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-All around the mulberry bush
-The monkey chased the weasel
-The monkey thought 'twas all in fun
-Pop! goes the weasel
-A penny for a spool of thread
-A penny for a needle
-That's the way the money goes
-Pop! goes the weasel
-Half a pound of tuppenny rice
-Half a pound of treacle
-Mix it up and make it nice
-Pop! goes the weasel
\ No newline at end of file
diff --git a/jack-and-jill.txt b/jack-and-jill.txt
deleted file mode 100644
index 7a064b4..0000000
--- a/jack-and-jill.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-Jack and Jill went up the hill
-To fetch a pail of water
-Jack fell down and broke his crown
-And Jill came tumbling after
-Jack got up, and home did trot
-As fast as he could caper
-To old Dame Dob, who patched his nob
-With vinegar and brown paper
-Jack and Jill went up the hill
-To fetch a pail of water
-Jack fell down and broke his crown
-And Jill came tumbling after
\ No newline at end of file
commit 83047232b3c41babbfa0a0bb479493a740e4a7f7 (master)
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:15:13 2019 +0700
Added jack-and-jill.txt.
diff --git a/all-around-the-mulberry-bush.txt b/all-around-the-mulberry-bush.txt
new file mode 100644
index 0000000..2d62447
--- /dev/null
+++ b/all-around-the-mulberry-bush.txt
@@ -0,0 +1,12 @@
+All around the mulberry bush
+The monkey chased the weasel
+The monkey thought 'twas all in fun
+Pop! goes the weasel
+A penny for a spool of thread
+A penny for a needle
+That's the way the money goes
+Pop! goes the weasel
+Half a pound of tuppenny rice
+Half a pound of treacle
+Mix it up and make it nice
+Pop! goes the weasel
\ No newline at end of file
diff --git a/jack-and-jill.txt b/jack-and-jill.txt
new file mode 100644
index 0000000..7a064b4
--- /dev/null
+++ b/jack-and-jill.txt
@@ -0,0 +1,12 @@
+Jack and Jill went up the hill
+To fetch a pail of water
+Jack fell down and broke his crown
+And Jill came tumbling after
+Jack got up, and home did trot
+As fast as he could caper
+To old Dame Dob, who patched his nob
+With vinegar and brown paper
+Jack and Jill went up the hill
+To fetch a pail of water
+Jack fell down and broke his crown
+And Jill came tumbling after
\ No newline at end of file
commit a077c1f17711d1058de0318a656e675bb7953596
Author: fourthten <agung0410@gmail.com>
Date:   Fri Nov 8 14:00:59 2019 +0700
Added project overview to README.txt
diff --git a/README.txt b/README.txt
index e69de29..28264bd 100644
--- a/README.txt
+++ b/README.txt
@@ -0,0 +1 @@
+'This repo is a collection of my favorite nursery rhymes.'
commit 2b6165dbebc05813414f7acb768348108e497c2c
Author: fourthten <agung0410@gmail.com>
Date:   Fri Nov 8 13:58:52 2019 +0700
First commit.
diff --git a/README.txt b/README.txt
new file mode 100644
index 0000000..e69de29
D:\rhymes>git remote add origin https://github.com/Fourthten/rhymes.git
D:\rhymes>git push -u origin master
Enumerating objects: 10, done.
Counting objects: 100% (10/10), done.
Delta compression using up to 4 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (10/10), 1.13 KiB | 231.00 KiB/s, done.
Total 10 (delta 0), reused 0 (delta 0)
To https://github.com/Fourthten/rhymes.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```

### First Bob clones his fork of Alice's rhymes project.
### (If you're following along, replace bryanhirsch below with your own GitHub username.)
```
D:\>git clone https://github.com/Fourthten/rhymes.git
Cloning into 'rhymes'...
remote: Enumerating objects: 23, done.
remote: Counting objects: 100% (23/23), done.
remote: Compressing objects: 100% (17/17), done.
remote: Total 23 (delta 6), reused 20 (delta 3), pack-reused 0
Unpacking objects: 100% (23/23), done.
D:\>cd rhymes
```

### To keep things simple and tidy, Bob will keep the master branch in sync with Alice's version of the master branch.
### Bob creates a new branch, where he will store his changes.
```
D:\rhymes>git checkout -b hickory-dickory
Switched to a new branch 'hickory-dickory'
```

### Add Hickory Dickory Dock to the repo.
```
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/hickory-dickory-dock.txt
--2019-11-09 04:10:20--  https://www.acquia.com/sites/default/files/blog/hickory-dickory-dock.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.117.45, 104.16.118.45
Connecting to www.acquia.com (www.acquia.com)|104.16.117.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 04:10:22 ERROR 404: Not Found.
D:\rhymes>git add hickory-dickory-dock.txt
D:\rhymes>git commit -m "Added hickory-dickory-dock.txt."
[hickory-dickory d3b469c] Added hickory-dickory-dock.txt.
 1 file changed, 53 insertions(+)
 create mode 100644 hickory-dickory-dock.txt
D:\rhymes>git push origin hickory-dickory
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 515 bytes | 257.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
remote:
remote: Create a pull request for 'hickory-dickory' on GitHub by visiting:
remote:      https://github.com/Fourthten/rhymes/pull/new/hickory-dickory
remote:
To https://github.com/Fourthten/rhymes.git
 * [new branch]      hickory-dickory -> hickory-dickory
```

### Alice renames origin -> alice.
```
D:\>cd rhymes
D:\rhymes>git remote rename origin alice
```

### Add a remote pointing to Bob's copy of the project.
```
D:\rhymes>git remote add bob https://github.com/Fourthten/rhymes.git
```

### Review remotes.
```
D:\rhymes>git remote
alice
bob
```

### Confirm each remote points to the correct repository.
```
D:\rhymes>git remote -v
alice   https://github.com/Fourthten/rhymes.git (fetch)
alice   https://github.com/Fourthten/rhymes.git (push)
bob     https://github.com/Fourthten/rhymes.git (fetch)
bob     https://github.com/Fourthten/rhymes.git (push)
```

### Fetch a copy of Bob's work.
```
D:\rhymes>git fetch bob
From https://github.com/Fourthten/rhymes
 * [new branch]      hickory-dickory -> bob/hickory-dickory
 * [new branch]      master          -> bob/master
```

### Review all the branches (both local and remote).
```
D:\rhymes>git branch -a
* hickory-dickory
  master
  remotes/alice/HEAD -> alice/master
  remotes/alice/hickory-dickory
  remotes/alice/master
  remotes/bob/hickory-dickory
  remotes/bob/master
```

### Check out a local copy of Bob's work and review it.
```
D:\rhymes>git checkout -b bob/hickory-dickory
Switched to a new branch 'bob/hickory-dickory'
D:\rhymes>git diff master hickory-dickory
diff --git a/hickory-dickory-dock.txt b/hickory-dickory-dock.txt
new file mode 100644
index 0000000..1be6828
--- /dev/null
+++ b/hickory-dickory-dock.txt
@@ -0,0 +1,53 @@
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck one
+The mouse ran down,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck two
+And down he flew,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck three
+And he did flee,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck four,
+He hit the floor,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck five,
+The mouse took a dive,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck six,
+That mouse, he split,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck seven,
+8, 9, 10, 11,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+As twelve bells rang,
+The mousie sprang,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+"Why scamper?" asked the clock,
+"You scare me so
+I have to go!
+Hickory Dickory dock."
\ No newline at end of file
D:\rhymes>git log -1 -p
commit 870fa702b4e2a86f5a7f377eaab0efc722c2a25a (HEAD -> bob/hickory-dickory, bob/master, alice/master, alice/HEAD, master)
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:03:04 2019 +0700
    Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
diff --git a/d b/d
deleted file mode 100644
index 812f702..0000000
--- a/d
+++ /dev/null
@@ -1,41 +0,0 @@
-commit 663e6acfffb0c494c21c7e5b1ce44560f1d16bec (HEAD)
-Author: fourthten <agung0410@gmail.com>
-Date:   Sat Nov 9 03:31:07 2019 +0700
-
-    Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
-
-commit 8d28c49f32336fda6b19d229eaea6192b96270fe
-Author: fourthten <agung0410@gmail.com>
-Date:   Sat Nov 9 03:29:48 2019 +0700
-
-    Added jack-and-jill.txt.
-
-commit d4a9e0860a8cf52fd4a36e9b3914677ef320e7f0
-Author: fourthten <agung0410@gmail.com>
-Date:   Sat Nov 9 03:29:13 2019 +0700
-
-    Added all-around-the-mulberry-bush.txt.
-
-commit 085dd16a56c23fe2e0e2641d39e1499e2b0f24bc
-Author: fourthten <agung0410@gmail.com>
-Date:   Sat Nov 9 03:25:53 2019 +0700
-
-    back
-
-commit 83047232b3c41babbfa0a0bb479493a740e4a7f7 (master)
-Author: fourthten <agung0410@gmail.com>
-Date:   Sat Nov 9 03:15:13 2019 +0700
-
-    Added jack-and-jill.txt.
-
-commit a077c1f17711d1058de0318a656e675bb7953596
-Author: fourthten <agung0410@gmail.com>
-Date:   Fri Nov 8 14:00:59 2019 +0700
-
-    Added project overview to README.txt
-
-commit 2b6165dbebc05813414f7acb768348108e497c2c
-Author: fourthten <agung0410@gmail.com>
-Date:   Fri Nov 8 13:58:52 2019 +0700
-
-    First commit.
```

### Checkout master and merge Bobs changes in.
```
D:\rhymes>git checkout master
Switched to branch 'master'
Your branch is up to date with 'alice/master'.
D:\rhymes>git merge hickory-dickory
Updating 870fa70..d3b469c
Fast-forward
 hickory-dickory-dock.txt | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 hickory-dickory-dock.txt
```

### Push changes up to GitHub git push alice master
### Remove our local copy of the hickory-dickory branch. We don't need it anymore.
```
D:\rhymes>git branch -D hickory-dickory
Deleted branch hickory-dickory (was d3b469c).
D:\>cd rhymes
D:\rhymes>git remote rename origin bob
```

### Add a remote pointing to Alice's copy of the project.
```
D:\rhymes>git remote add alice https://github.com/Fourthten/rhymes.git
```

### Review remotes.
```
D:\rhymes>git remote
alice
bob
```

### Confirm each remote points to the correct repository. 
```
D:\rhymes>git remote -v
alice   https://github.com/Fourthten/rhymes.git (fetch)
alice   https://github.com/Fourthten/rhymes.git (push)
bob     https://github.com/Fourthten/rhymes.git (fetch)
bob     https://github.com/Fourthten/rhymes.git (push)
```

### Update master branch. 
### (As an alternative to fetch, use `remote update` to update all your remotes.)
```
D:\rhymes>git remote update
Fetching alice
Fetching bob
D:\rhymes>git checkout master
Already on 'master'
Your branch is ahead of 'alice/master' by 1 commit.
  (use "git push" to publish your local commits)
D:\rhymes>git merge alice/master
Already up to date.
```

### To confirm you did everything right check the difference between your local copy of master 
### and Alice's master branch. There should be no difference. 
```
D:\rhymes>git diff alice/master
diff --git a/hickory-dickory-dock.txt b/hickory-dickory-dock.txt
new file mode 100644
index 0000000..1be6828
--- /dev/null
+++ b/hickory-dickory-dock.txt
@@ -0,0 +1,53 @@
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck one
+The mouse ran down,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck two
+And down he flew,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck three
+And he did flee,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck four,
+He hit the floor,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck five,
+The mouse took a dive,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck six,
+That mouse, he split,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+The clock struck seven,
+8, 9, 10, 11,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+The mouse ran up the clock,
+As twelve bells rang,
+The mousie sprang,
+Hickory Dickory dock.
+
+Hickory Dickory dock,
+"Why scamper?" asked the clock,
+"You scare me so
+I have to go!
+Hickory Dickory dock."
\ No newline at end of file 
```

### Push to GitHub 
```
D:\rhymes>git push bob master
Total 0 (delta 0), reused 0 (delta 0)
To https://github.com/Fourthten/rhymes.git
   870fa70..d3b469c  master -> master
D:\rhymes>git checkout -b bobs-changes
Switched to a new branch 'bobs-changes'
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/jack-be-nimble.txt
--2019-11-09 04:31:10--  https://www.acquia.com/sites/default/files/blog/jack-be-nimble.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.118.45, 104.16.117.45
Connecting to www.acquia.com (www.acquia.com)|104.16.118.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 04:31:11 ERROR 404: Not Found.
D:\rhymes>git add jack-be-nimble.txt
D:\rhymes>git commit -m "Added jack-be-nimble.txt."
[bobs-changes 49d37c1] Added jack-be-nimble.txt.
 1 file changed, 29 insertions(+)
 create mode 100644 jack-be-nimble.txt
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/mother-goose.txt
--2019-11-09 04:32:44--  https://www.acquia.com/sites/default/files/blog/mother-goose.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.118.45, 104.16.117.45
Connecting to www.acquia.com (www.acquia.com)|104.16.118.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 04:32:45 ERROR 404: Not Found.
D:\rhymes>git add mother-goose.txt
D:\rhymes>git commit -m "Added mother-goose.txt."
[bobs-changes 2ab295b] Added mother-goose.txt.
 1 file changed, 29 insertions(+)
 create mode 100644 mother-goose.txt
D:\rhymes>git commit -am "Updated README.txt."
[bobs-changes 1fc126c] Updated README.txt.
 1 file changed, 1 insertion(+), 1 deletion(-)
```

### Review changes word-by-word. Commit.
```
D:\rhymes>git diff --word-diff
D:\rhymes>git commit -am "Fixed typo in README.txt."
On branch bobs-changes
nothing to commit, working tree clean
D:\rhymes>git commit -am "Updated README.txt."
[bobs-changes e5ff71b] Updated README.txt.
 1 file changed, 1 insertion(+), 1 deletion(-)
D:\rhymes>git commit -am "Updated README.txt."
[bobs-changes 199ae9b] Updated README.txt.
 1 file changed, 1 insertion(+), 1 deletion(-)
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/old-king-cole.txt
--2019-11-09 04:41:12--  https://www.acquia.com/sites/default/files/blog/old-king-cole.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.117.45, 104.16.118.45
Connecting to www.acquia.com (www.acquia.com)|104.16.117.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 04:41:13 ERROR 404: Not Found.
D:\rhymes>git add old-king-cole.txt
D:\rhymes>git commit -m "Added old-king-cole.txt."
[bobs-changes cda0b03] Added old-king-cole.txt.
 1 file changed, 14 insertions(+)
 create mode 100644 old-king-cole.txt
D:\rhymes>wget https://www.acquia.com/sites/default/files/blog/twinkle-twinkle.txt
--2019-11-09 04:43:02--  https://www.acquia.com/sites/default/files/blog/twinkle-twinkle.txt
Resolving www.acquia.com (www.acquia.com)... 104.16.117.45, 104.16.118.45
Connecting to www.acquia.com (www.acquia.com)|104.16.117.45|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2019-11-09 04:43:03 ERROR 404: Not Found.
D:\rhymes>git add twinkle-twinkle.txt
D:\rhymes>git commit -m "Added twinkle-twinkle.txt."
On branch bobs-changes
nothing to commit, working tree clean
D:\rhymes>git commit -am "Updated README.txt."
[bobs-changes fcfd75b] Updated README.txt.
 1 file changed, 1 insertion(+), 1 deletion(-)
D:\rhymes>git log
commit fcfd75b9c5a7357487b383518e0901bbc5da5c99 (HEAD -> bobs-changes)
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:45:12 2019 +0700
    Updated README.txt.
commit cda0b03272a214c1aa50c1b94c1f4996465bd82e
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:42:40 2019 +0700
    Added old-king-cole.txt.
commit 199ae9bad23f43ed027219c5430362279a67ebc6
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:39:40 2019 +0700
    Updated README.txt.
commit e5ff71b35009dd940a8ed2785e1b5722e14211aa
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:39:23 2019 +0700
    Updated README.txt.
commit 1fc126c3f2b0e1ef33182f711c6ef3ba6455dd84
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:38:13 2019 +0700
    Updated README.txt.
commit 2ab295b9e3a9665f0b776917ea67c102bf0c6777
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:34:20 2019 +0700
    Added mother-goose.txt.
commit 49d37c14771e62d7e5c212c302e0df289be5c350
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:32:36 2019 +0700
    Added jack-be-nimble.txt.
commit d3b469cccb10f088f08df231dd53f68ded34df4c (bob/master, bob/hickory-dickory, alice/hickory-dickory, master)
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:11:24 2019 +0700
    Added hickory-dickory-dock.txt.
commit 870fa702b4e2a86f5a7f377eaab0efc722c2a25a (alice/master, alice/HEAD, bob/hickory-dickory)
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 04:03:04 2019 +0700
    Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
commit de3fb4384ad020e1eb9b36813171225aeaa8ed48
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:46:56 2019 +0700
    Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
commit 663e6acfffb0c494c21c7e5b1ce44560f1d16bec
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:31:07 2019 +0700
    Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
commit 8d28c49f32336fda6b19d229eaea6192b96270fe
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:29:48 2019 +0700
    Added jack-and-jill.txt.
commit d4a9e0860a8cf52fd4a36e9b3914677ef320e7f0
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:29:13 2019 +0700
    Added all-around-the-mulberry-bush.txt.
commit 085dd16a56c23fe2e0e2641d39e1499e2b0f24bc
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:25:53 2019 +0700
    back
commit 83047232b3c41babbfa0a0bb479493a740e4a7f7
Author: fourthten <agung0410@gmail.com>
Date:   Sat Nov 9 03:15:13 2019 +0700
    Added jack-and-jill.txt.
commit a077c1f17711d1058de0318a656e675bb7953596
Author: fourthten <agung0410@gmail.com>
Date:   Fri Nov 8 14:00:59 2019 +0700
    Added project overview to README.txt
commit 2b6165dbebc05813414f7acb768348108e497c2c
Author: fourthten <agung0410@gmail.com>
Date:   Fri Nov 8 13:58:52 2019 +0700
    First commit.
D:\rhymes>git log --oneline
fcfd75b (HEAD -> bobs-changes) Updated README.txt.
cda0b03 Added old-king-cole.txt.
199ae9b Updated README.txt.
e5ff71b Updated README.txt.
1fc126c Updated README.txt.
2ab295b Added mother-goose.txt.
49d37c1 Added jack-be-nimble.txt.
d3b469c (bob/master, bob/hickory-dickory, alice/hickory-dickory, master) Added hickory-dickory-dock.txt.
870fa70 (alice/master, alice/HEAD, bob/hickory-dickory) Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
de3fb43 Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
663e6ac Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
8d28c49 Added jack-and-jill.txt.
d4a9e08 Added all-around-the-mulberry-bush.txt.
085dd16 back
8304723 Added jack-and-jill.txt.
a077c1f Added project overview to README.txt
2b6165d First commit.
D:\rhymes>git log --oneline
fcfd75b (HEAD -> bobs-changes) Updated README.txt.
cda0b03 Added old-king-cole.txt.
199ae9b Updated README.txt.
e5ff71b Updated README.txt.
1fc126c Updated README.txt.
2ab295b Added mother-goose.txt.
49d37c1 Added jack-be-nimble.txt.
d3b469c (bob/master, bob/hickory-dickory, alice/hickory-dickory, master) Added hickory-dickory-dock.txt.
870fa70 (alice/master, alice/HEAD, bob/hickory-dickory) Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
de3fb43 Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
663e6ac Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
8d28c49 Added jack-and-jill.txt.
d4a9e08 Added all-around-the-mulberry-bush.txt.
085dd16 back
8304723 Added jack-and-jill.txt.
a077c1f Added project overview to README.txt
2b6165d First commit.
```

### Rewrite history going back as far as commit 4b15370.
```
git rebase -i 4b15370
pick 49d37c1 Added jack-be-nimble.txt.
pick 2ab295b Added mother-goose.txt.
pick 1fc126c Updated README.txt.
pick e5ff71b Updated README.txt.
pick 199ae9b Updated README.txt.
pick cda0b03 Added old-king-cole.txt.
pick fcfd75b Updated README.txt.
# Rebase d3b469c..fcfd75b onto e5ff71b (7 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
#
# These lines can be re-ordered; they are executed from top to bottom.
pick 49d37c1 Added jack-be-nimble.txt.
pick 2ab295b Added mother-goose.txt.
pick 1fc126c Updated README.txt.
squash e5ff71b Updated README.txt.
squash 199ae9b Updated README.txt.
pick cda0b03 Added old-king-cole.txt.
squash fcfd75b Updated README.txt.
D:\rhymes>git log --oneline
935d17e (HEAD -> bobs-changes) Added old-king-cole.txt.
296990c Updated README.txt.
2ab295b Added mother-goose.txt.
49d37c1 Added jack-be-nimble.txt.
d3b469c (bob/master, bob/hickory-dickory, alice/hickory-dickory, master) Added hickory-dickory-dock.txt.
870fa70 (alice/master, alice/HEAD, bob/hickory-dickory) Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
de3fb43 Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
663e6ac Added old-mother-hubbard.txt, twinkle-twinkle.txt, hokey-pokey.txt
8d28c49 Added jack-and-jill.txt.
d4a9e08 Added all-around-the-mulberry-bush.txt.
085dd16 back
8304723 Added jack-and-jill.txt.
a077c1f Added project overview to README.txt
2b6165d First commit.
```