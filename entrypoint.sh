#!/bin/bash

sed -i "s/BLOG_TITLE/$BLOG_TITLE/" config.yml
sed -i "s/BLOG_URL/$BLOG_URL/" config.yml
sed -i "s/BLOG_GA/$BLOG_GA/" config.yml
git clone $BLOG_THEME_URL themes/thistheme
echo "start notion-tpl"
exec notion-tpl --table-id $TABLE_ID --token $TOKEN --export-path /src/content/posts --image-path /src/images --template /etc/notion-tpl/hugo.md.tpl --cmd hugo
