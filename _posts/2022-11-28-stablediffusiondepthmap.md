 ---
layout:     post
title:      Stable Diffusion Depth
date:       2022-11-28
summary:    Stable Diffusion Depth Map
categories: Refs. Diffusion Depth 
---

 Xmas came early because Stable Diffusion 2.0 is out — and the feature I’m most excited about is depth2img. Inferring a depth map to maintain structural coherence will be pretty sweet for all sorts of #img2img use cases. Let’s explore why.


## Why Depth Aware Image-to-Image Matters
With current image-to-image workflows, the image pixels and text prompts only tells the AI model so much — so no matter how you tweak the parameters, there’s a good chance that the output will deviate quite a bit from the input image, especially in terms of geometric structure.


Instead, we can get a much better result by guiding the image generation process using a depth map — which coarsely represents the 3D structure of the human face in the example above. A depth map is used under the hood by your smartphone to give you that nice bokeh blur by separating you from the background, and even to relight your face while respecting it’s contours.

So how do we generate a depth map? Well, Stable Diffusion uses MiDaS for monocular depth estimation in their Depth2Image feature. MiDAS is a state-of-the-art model created by Intel and ETH Zurich researchers that can infer depth using a single 2D photo as an input.

What else can we do with depth2image? While this type of “approximate” depth is a good start, I suspect we’ll quickly see a Blender plug-in that plumbs in a far more accurate z-depth pass for 3D img2img fun. Since 3D software is already dimensional (duh!), generating such a synthetic depth map is trivial, and already used extensively in VFX workflows.

What this means is, artists can quickly “greybox” a 3D scene — focusing on the spatial 3D layout, versus the textures, lighting and shading, and immediately explore a multitude of directions with generative AI, before committing to implementing one “for real.” Such depth-aware img2img workflows will save countless hours in 3D world building and concept art. Check out this example below to imagine what’s in store:

