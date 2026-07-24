Day-1

imagePullPolicy: Always — why it was masking the bug?

- it tells kubernetes server to pull the image with :latest tag, but out pods if rebuilt/restarted will pull the image always that too the mutable :latest tag, and the kubenetes deployment manifest had value of latest, which means even if there is code change the image will go with tag :latest and the pods with changed code(new code) and unchanged code(old one) will both have diffrent code but with same name and will act diffrent, and will create indiffrences 


Write down why secrets.TOKEN not GITHUB_TOKEN?

- GITHUB_TOKEN: GitHub intentionally blocks actions authenticated with GITHUB_TOKEN from triggering new workflow runs (e.g., pushing a commit or opening a PR won't trigger a on: push or on: pull_request workflow). This prevents accidental infinite loops.  

Custom Token (PAT/App): Pushes or actions made using a custom Personal Access Token or GitHub App token will trigger follow-up workflows (like running CI/CD checks on automated commits).

Day-2



