// Vertex shader

struct VertexInput {
    [[location(0)]] vertice_coordinates: vec2<f32>;
    [[location(1)]] texture_coordinates: vec2<f32>;
};

struct VertexOutput {
    [[builtin(position)]] clip_position: vec4<f32>;
    [[location(0)]] texture_coordinates: vec2<f32>;
};

[[stage(vertex)]]
fn main(model: VertexInput) -> VertexOutput
{
    var out: VertexOutput;
    out.texture_coordinates = model.texture_coordinates;
    out.clip_position = vec4<f32>(model.vertice_coordinates, 0.0, 1.0);
    return out;
}

// Fragment shader

[[group(0), binding(0)]]
var texture: texture_2d<f32>;
[[group(0), binding(1)]]
var sampler: sampler;

[[stage(fragment)]]
fn main(in: VertexOutput) -> [[location(0)]] vec4<f32>
{
    return textureSample(texture, sampler, in.texture_coordinates);
}
