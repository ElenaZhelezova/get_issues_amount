import requests
import json
import os


def main(user, token):
    repos_info_request = requests.get(
        'https://api.github.com/orgs/devopshq/repos',
        auth=(user, token))
    repos_info = json.loads(repos_info_request.text)

    for repo in repos_info:
        print(repo.get('full_name'))
        print('#', repo.get('open_issues_count'), '\n')


if __name__ == '__main__':
    git_username = os.environ.get('USERNAME')
    git_token = os.environ.get('TOKEN')
    main(git_username, git_token)
