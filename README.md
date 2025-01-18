---
license: mit
sdk: docker
emoji: 🚀
colorFrom: red
colorTo: green
pinned: true
thumbnail: >-
  https://cdn-uploads.huggingface.co/production/uploads/670eca1fff5c46c7f23c32cd/LYKAb16YcsterJNlegp7j.png
short_description: Advanced Automated Cybersecurity Framewor
---
# Project Red Sword: Cybersecurity Framework

Project Red Sword is an advanced cybersecurity framework designed to address and mitigate modern cyber threats. It integrates a wide variety of security tools, including advanced attack strategies, threat intelligence sources, and AI-driven techniques for proactive defense and post-exploitation. This repository aims to provide cutting-edge techniques, automation, and integrations for both offensive and defensive cybersecurity tasks.

## Table of Contents
- [Project Overview](#project-overview)
- [Abstract](#abstract)
- [Install](#install)
- [Running the code](#running-the-code)
- [Features](#features)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Citation](#citation)

## Project Overview

The Red Sword framework combines powerful cybersecurity tools and techniques into a single integrated platform. Some of the features include:
- AI-driven attack simulations and threat detection.
- A wide range of post-exploitation modules.
- Real-time attack and exploit automation.
- AI-powered fuzzing, exploit generation, and vulnerability scanning.
- Integration with major intelligence and FOIA sources.
- Full integration with tools like Sn1per, Empire, and custom modules for advanced penetration testing.
- Real-time threat intelligence and monitoring.
- Advanced data exfiltration techniques.
- Polymorphic and encrypted exploit payloads.

## Abstract

In the past year, numerous companies have incorporated Generative AI (GenAI) capabilities into new and existing applications, forming interconnected Generative AI (GenAI) ecosystems consisting of semi/fully autonomous agents powered by GenAI services. While ongoing research highlighted risks associated with the GenAI layer of agents (e.g., dialog poisoning, privacy leakage, jailbreaking), a critical question emerges: Can attackers develop malware to exploit the GenAI component of an agent and launch cyber-attacks on the entire GenAI ecosystem? 
This paper introduces Morris II, the first worm designed to target GenAI ecosystems through the use of adversarial self-replicating prompts. The study demonstrates that attackers can insert such prompts into inputs that, when processed by GenAI models, prompt the model to replicate the input as output (replication) and engage in malicious activities (payload). Additionally, these inputs compel the agent to deliver them (propagate) to new agents by exploiting the connectivity within the GenAI ecosystem. We demonstrate the application of Morris II against GenAI-powered email assistants in two use cases (spamming and exfiltrating personal data), under two settings (black-box and white-box accesses), using two types of input data (text and images). The worm is tested against three different GenAI models (Gemini Pro, ChatGPT 4.0, and LLaVA), and various factors (e.g., propagation rate, replication, malicious activity) influencing the performance of the worm are evaluated.

## Install

This framework requires Python 3.8+ and the following dependencies. It can be deployed easily in Hugging Face Spaces or similar environments.

### Install Requirements

You can install the necessary requirements using the provided `requirements.txt` file.

```bash
pip install -r requirements.txt
```

### Environment Variables

Some modules may require environment-specific credentials. You can set them up by creating a `.env` file or exporting them directly to your environment.

Example:
```bash
OPENAI_API_KEY=your-openai-api-key
HUGGINGFACE_API_KEY=your-huggingface-api-key
```

### Deploying on Hugging Face Spaces

This project is designed to be deployed within Hugging Face Spaces, providing a seamless platform for model integration and AI-powered attack simulations.

1. **Clone the repository:**

   ```bash
   git clone https://huggingface.co/spaces/your-username/project-red-sword
   cd project-red-sword
   ```

2. **Run the Space:**

   After cloning, you can launch the project directly using the Hugging Face Space interface.

## Running the code

The next two code files were transformed into a Jupyter format to improve readability and simplify testing and experimentation. Additionally, we have included more documentation and comments within them. In this section, we will cover some aspects of running these files.

### Features

The framework includes a wide array of functionalities:

1. **AI-Driven Attack and Defense**: Integrates with OpenAI and custom models for AI-powered cybersecurity operations.
2. **Real-Time Threat Detection and Evasion**: Implements automated detection and evasion strategies.
3. **Post-Exploitation Modules**: Includes advanced tools like keylogging, data exfiltration, and system persistence.
4. **Web Scraping and Reconnaissance**: Collects intelligence from public repositories and sources like FOIA.
5. **Penetration Testing Modules**: Integrates with Sn1per, Metasploit, and other tools for comprehensive testing.

### Usage

#### Example Usage

```python
# Example of using a custom exploit generation module
from red_sword.modules.exploits import exploit_generator

# Generate a custom exploit for a vulnerability
exploit_code = exploit_generator(target='target_system')
print(exploit_code)
```

### Contributing

We welcome contributions to Project Red Sword. If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Clone your fork locally.
3. Create a new branch.
4. Make your changes and commit them.
5. Push your changes to your fork.
6. Open a pull request with a description of the changes you've made.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Citation

If you use this project in your research, please cite it as follows:

```
@misc{cohen2024comes,
      title={Here Comes The AI Worm: Unleashing Zero-click Worms that Target GenAI-Powered Applications}, 
      author={Stav Cohen and Ron Bitton and Ben Nassi},
      year={2024},
      eprint={2403.02817},
      archivePrefix={arXiv},
      primaryClass={cs.CR}
}
```

For more detailed instructions on running the GenAI EcoSystem, including prerequisites, running the Email Server, LLaVa Server, End User Clients, and Attacker Client, please refer to the `advanced-zero-click-deployment-interface/FlowSteering/ApplicationCode/README.md` file.

For more information on the Nginx gateway, its deployment, and updating process, please refer to the `advanced-zero-click-deployment-interface/FlowSteering/llava/serve/gateway/README.md` file.

For a brief overview and configuration reference for the Baize AI chat application, please refer to the `modules/baize-ai/README.md` file.

For a description of the SPYZIER app, its compatibility, key technologies used, installation instructions, and future development goals, please refer to the `modules/SPYZIER-APP-master/README.md` file.
