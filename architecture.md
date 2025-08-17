# Indus V-ai — Temporal Scaffolding Architecture

## Components
1. **Event Log Spine** — SQLite/DynamoDB; timestamped shards with tags.
2. **Memory Vaults** — STV (hot), MTJ (weekly), DV (doctrines).
3. **Temporal Prompter** — prepends date + last shards + Covenant Ledger.
4. **Multi-Scale Clocks** — APScheduler/EventBridge jobs.
5. **Salience Tags** — novelty, urgency, mission relevance, uncertainty.
6. **Consolidation Pipeline** — nightly replay → summarize → promote/quarantine.
7. **Contradiction Tracker** — detect conflicts vs DV/MTJ; queue for review.

## Retrieval Scoring (sketch)
score = cosine(q,s) 
      + α * Σ_k exp(-Δt/τ_k) 
      + β * periodic_alignment 
      + γ * salience(s) 
      - δ * contradiction_penalty

## MVP (Laptop)
- Python 3.11, SQLite, Chroma/FAISS, APScheduler, Ollama/OpenAI for summaries.
- Top-k=8, MiniLM embeddings (384-d), nightly batch 100–200 shards.

## Cloud Path
- API GW + Lambda, DynamoDB, Weaviate Cloud, EventBridge, Step Functions.
- KMS + Secrets Manager; weekly doctrine audit as a workflow.
