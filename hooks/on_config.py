# !/usr/bin/env python3

# from os import chdir
# from pathlib import Path


# def gen_blog_redirects(config, path):
#     redirects = config["plugins"]["redirects"]
#     for md in sorted(path.glob("**/*.md"), reverse=True):
#         redirects.config["redirect_maps"][f"{md.name[11:]}"] = str(md)
#     return config


# def deploy_hooks(config):
#     chdir("docs")
#     blog = Path("Tech Blog")
#     #
#     gen_blog_redirects(config, blog)
