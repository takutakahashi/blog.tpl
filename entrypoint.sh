#!/bin/bash

sed -i "s/BLOG_TITLE/$BLOG_TITLE/" config.yml
sed -i "s/BLOG_URL/$BLOG_URL/" config.yml
sed -i "s/BLOG_GA/$BLOG_GA/" config.yml
if [[ "$BLOG_THEME_BRANCH" = "" ]]; then
  BLOG_THEME_BRANCH="master"
fi
git clone $BLOG_THEME_URL themes/thistheme -b "$BLOG_THEME_BRANCH" || git clone $BLOG_THEME_URL themes/thistheme -b master || git clone $BLOG_THEME_URL themes/thistheme -b main
exec notion-tpl --table-id $TABLE_ID --token $TOKEN --export-path /src/content/posts --image-path /src/images --template /etc/notion-tpl/hugo.md.tpl --cmd hugo $ONCE
