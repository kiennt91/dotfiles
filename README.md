dotfile 系の設定
=================

bash について
--------------

ホームディレクトリに配置する。
既存のファイルが存在する場合は、設定を取捨選択し、既存のファイルに追記する。

git について
------------

現在のディレクトが git で管理されている場合、ターミナルに git のブランチ名を表示するような
設定を行う。
各種 .gitxxx ファイルをホームディレクトリに配置すること。
これらのファイルを使用した設定は、.bashrc に記述している。

vim について
-------------

ホームディレクトに配置する。
neobundle を使用して vim のプラグインを管理するので、以下のサイトを参考にして
neobundle の導入を行う。

http://qiita.com/puriketu99/items/1c32d3f24cc2919203eb

補足: git clone してきたあとは、vim 上で :NeoBundleInstall を実行すればよい。

イメージについて
---------------

![alt tag](https://s17.postimg.org/hych1cgpb/git.png)

![alt tag](https://s13.postimg.org/6bwltdftj/image.png)
