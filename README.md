# 🌍 P-S-Wave-Propagation | P파와 S파 전파 시뮬레이션

![godot-logo](https://upload.wikimedia.org/wikipedia/commons/6/6a/Godot_icon.svg)  
*Godot Engine 기반의 지진파 시뮬레이션 프로젝트*

---

## 📖 소개 | Introduction

이 프로젝트는 Godot 엔진을 이용하여 지진 발생 시 **P파(종파)**와 **S파(횡파)**의 전파 현상을 2D 시뷰레이션으로 구현합니다.  
지구 내부의 **층별 밀도**, **탄성 계수**를 반영한 **PREM 모델**을 기반으로 하며,  
매질 변화에 따른 속도 변화도 표현됩니다.

> This project simulates how seismic waves (P-waves and S-waves) propagate through the Earth's layers using the **Godot Engine**.  
> It is based on the **PREM (Preliminary Reference Earth Model)** and incorporates density and elasticity to realistically visualize wave speeds and behaviors.

---

## 🎮 작동 방식 | How It Works

- 🌐 **지구 내부 모델링**  
  - 중심핵(core), 외핵(outer core), 맨틀(mantle), 지각(crust)으로 분리된 레이어  
  - 각 층은 밀도(ρ), 체적탄성계수(K), 전단탄성계수(μ)를 가짐
- 🌀 **P파(Solid & Liquid)**  
  - 액체 상태의 외핵도 통과 가능  
  - 밀도와 탄성계수 기반 속도 계산: `v_p = sqrt((K + 4μ/3) / ρ)`
- 🌊 **S파(Solid Only)**  
  - 액체 매질에서는 진행하지 않음  
  - 속도 계산: `v_s = sqrt(μ / ρ)`
- 🕹️ **Godot를 통한 시각화**  
  - 실제 지진파 진행처럼 원형 파동이 각 층을 따라 움직이며 속도 변화를 보임  
  - 경계에서 반사 및 굴절 구현 준비 중

---

## ✨ 특징 | Features

- 📊 **실제 과학 모델 기반 (PREM)**
- 🎓 **P/S파 물리 특성 반영**
- 🧪 **Snell's Law(스넬의 법칙)** 기반 굴절 확장 예정
- 🛠️ **학습용/연구용 오픈소스**

---

## 🧱 기술 스택 | Tech Stack

| 항목        | 사용 기술          |
|------------|------------------|
| Game Engine | [Godot Engine 4.x](https://godotengine.org/) |
| Language    | GDScript         |
| Simulation Model | PREM (Density, Elastic Moduli) |
| Version Control | Git, GitHub     |

---

## ⏭️ 추후 개발 계획 | Future Work

- 🧭 **파형의 굴절 시뮬레이션** 구현 (스넬의 법칙 기반)
- 📍 **PS 도달 시점 시각화** 및 로그 기록 기능
- 🌐 **다층매질 통과 및 속력 변화 정밀 모델링**

---

## 📁 파일 구조 | File Structure

